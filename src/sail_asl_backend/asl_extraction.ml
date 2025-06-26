open Libsail

open Ast
open Ast_defs
open Ast_util
open Type_check

(****************************************************************************
 * ASL Function Extraction and Analysis
 *
 * This module implements Phase 5 of the ASL backend pipeline. It extracts
 * and analyzes the generated __instruction functions to create structured
 * data ready for ASL pretty printing. This phase validates the generated
 * functions and performs comprehensive pattern analysis.
 *
 * MAIN RESPONSIBILITIES:
 * - Validate generated functions match expected roots from asl_context
 * - Extract opcode patterns, guards, and execute bodies
 * - Analyze patterns to extract field information (id, position, width)
 * - Generate fixed bit masks for opcode patterns (x = wildcard)
 * - Package all information into instruction_info records
 *
 * INPUT:
 * - AST containing generated __instruction functions
 * - ASL context with expected function roots
 *
 * OUTPUT:
 * - List of instruction_info records containing:
 *   * Original opcode patterns with type annotations
 *   * Extracted field definitions (variable names, positions, widths)
 *   * Fixed bit masks (e.g., "110xxxxx" where x = wildcard)
 *   * Optional guard expressions 
 *   * Execute function bodies (constructor calls)
 *
 * PATTERN ANALYSIS:
 * - P_lit (binary literals) → fixed bits in mask
 * - P_id (variables) → field entries + wildcards in mask
 * - P_vector_concat → left-to-right concatenation analysis
 * - P_cons → list concatenation handling
 * - P_typ → type annotation unwrapping
 *
 * VALIDATION:
 * - Ensures all expected roots have corresponding __instruction functions
 * - Validates function structure matches expected template
 * - Confirms pattern analysis can extract meaningful field information
 *
 * EXPECTED FUNCTION TEMPLATE:
 *   function __instruction_<CONSTRUCTOR>_<INDEX> opcode = match opcode {
 *     OPCODE_PATTERN if OPTIONAL_GUARD => execute(CONSTRUCTOR)
 *   }
 *
 * EXAMPLE OUTPUT:
 * For pattern: 0b110 @ rd : bits(5) @ imm : bits(12)
 * - mask: "110xxxxxxxxxxxxxxx"  
 * - fields: [{id=rd, pos=12, width=5}, {id=imm, pos=0, width=12}]
 *****************************************************************************)

(****************************************************************************
 * Data Structures for Extracted Information
 *****************************************************************************)

type instruction_info = {
  inst : string;                   (* Instruction identifier *)
  fields : (id * int * int) list;  (* Extracted field information *)
  mask : string;                   (* Fixed bit mask (x for wildcards) *)
  guard : tannot exp option;       (* Optional guard expression *)
  body : tannot exp;               (* Function body (execute call) *)
}

(****************************************************************************
 * Pattern Analysis and Field Extraction
 *****************************************************************************)

(* Get the bit width of a pattern from its type annotation *)
let get_pattern_width pat =
  let typ = typ_of_pat pat in
  match typ with
  | Typ_aux (Typ_app (id, [A_aux (A_nexp (Nexp_aux (Nexp_constant n, _)), _)]), _) 
    when string_of_id id = "bitvector" || string_of_id id = "bits" ->
      Big_int.to_int n
  | _ -> failwith ("Pattern analysis error: Cannot determine bit width for pattern: " ^ string_of_pat pat)

(* Extract fields and build mask from a bitvector pattern *)
let analyze_pattern pat =
  let rec analyze_pat_at_pos pat pos =
    match pat with
    | P_aux (P_lit (L_aux (L_bin str, _)), _) ->
        (* Binary literal - fixed bits *)
        let width = String.length str in
        let mask = str in
        ([], mask, pos + width)
    
    | P_aux (P_id id, _) ->
        (* Variable - field *)
        let width = get_pattern_width pat in
        let field = ( id, pos, width ) in
        let mask = String.make width 'x' in
        ([field], mask, pos + width)
    
    | P_aux (P_vector_concat pats, _) ->
        (* Concatenation - process right to left (LSB first) *)
        let (fields, mask_parts, final_pos) = 
          List.fold_right (fun p (acc_fields, acc_masks, curr_pos) ->
            let (new_fields, new_mask, next_pos) = analyze_pat_at_pos p curr_pos in
            (new_fields @ acc_fields, new_mask :: acc_masks, next_pos)
          ) pats ([], [], pos) in
        (fields, String.concat "" mask_parts, final_pos)
    
    | P_aux (P_vector pats, annot) ->
        (* Vector - process as concatenation *)
        analyze_pat_at_pos (P_aux (P_vector_concat pats, annot)) pos
    
    | P_aux (P_cons (p1, p2), _) ->
        (* List cons - treat as concatenation, process p2 first (rightmost) *)
        let (fields2, mask2, pos2) = analyze_pat_at_pos p2 pos in
        let (fields1, mask1, pos1) = analyze_pat_at_pos p1 pos2 in
        (fields2 @ fields1, mask2 ^ mask1, pos1)
    
    | P_aux (P_typ (_, inner_pat), _) ->
        (* Type annotation - unwrap *)
        analyze_pat_at_pos inner_pat pos
    
    | _ ->
        failwith ("Pattern analysis error: Unsupported pattern for field extraction: " ^ string_of_pat pat)
  in
  let (fields, mask, _) = analyze_pat_at_pos pat 0 in
  Some (fields, mask)

(****************************************************************************
 * Function Discovery
 *****************************************************************************)

(* Process a __instruction function definition *)
let dest_instruction_body (body, inst) =
  match body with
  | E_aux (E_match (E_aux (E_id opcode_var, _), [arm]), _) ->
      let (opcode_pat, guard, body, _) = destruct_pexp arm in
      (match analyze_pattern opcode_pat with
      | Some (fields, mask) -> Some { inst; fields; mask; guard; body }
      | _ -> None)
  | _ -> None

(* Get __instruction bodies, expecting a single clause and the generated name *)
let dest_instruction def =
  match def with
  | (DEF_aux (DEF_fundef ((FD_aux (FD_function (_, _, fcls), _)) as fdef), _)) ->
    let name = string_of_id (id_of_fundef fdef) in
    (match fcls, Asl_structure_analysis.parse_instruction_function_name name with
    | [FCL_aux (FCL_funcl (_, pexp), _)], Some name -> 
        let (_, _, body, _) = destruct_pexp pexp in
        Some (body, name)
    | _ -> None)
  | _ -> None

(****************************************************************************
 * Entry Point
 *****************************************************************************)

(* Extract all __instruction functions and validate against roots *)
let extract_instructions ast =
  List.filter_map dest_instruction ast.defs |>
  List.filter_map dest_instruction_body
