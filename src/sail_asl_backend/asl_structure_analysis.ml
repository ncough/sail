open Libsail

open Ast
open Ast_defs
open Ast_util
open Type_check
open Asl_context
open Callgraph

(****************************************************************************
 * ASL Structure Analysis and Function Generation
 *
 * Discovers instruction encodings from the SAIL specification and
 * generates typed __instruction functions.
 * These functions mirror the semantics of __instruction bocks in ASL.
 *
 * INPUT:
 * - Sail AST containing encdec function and execute function
 * - Configuration with instruction filters and function names
 *
 * OUTPUT:
 * - Updated AST with generated __instruction functions
 * - ASL context containing function roots for dead code elimination
 *
 * GENERATED FUNCTIONS:
 * Pattern: __instruction_<CONSTRUCTOR>_<INDEX>
 * Structure: function __instruction_ADDI_0 opcode = match opcode {
 *              PATTERN if GUARD => execute(CONSTRUCTOR)
 *            }
 *
 *****************************************************************************)

(****************************************************************************
 * Utility Functions
 *****************************************************************************)

(* Utility for instruction name given id + index *)
let instruction_of_id_index instr_id encoding_index =
  mk_id ("__instruction_" ^ string_of_id instr_id ^ "_" ^ string_of_int encoding_index)

(* Check if function name matches __instruction pattern and return NAME_INDEX string if so *)
let parse_instruction_function_name func_name =
  let prefix = "__instruction_" in
  if String.length func_name >= String.length prefix &&
     String.sub func_name 0 (String.length prefix) = prefix then
    let without_prefix = String.sub func_name 14 (String.length func_name - 14) in
    Some without_prefix
  else None

let is_instruction_function func_name =
  parse_instruction_function_name func_name <> None

(* Utility function for adding a list of items to a map, collecting into lists for a common key *)
let add_to_map_list map (key,value) =
  Bindings.update key (function None -> Some [value] | Some l -> Some (value :: l)) map

(* Utility function to add multiple items to a map at once *)
let assoc_to_binding (assoc : (id * 'a) list): 'a list Bindings.t =
  List.fold_left add_to_map_list Bindings.empty assoc

(****************************************************************************
 * Encoding Discovery - Find encoding function and pull out its cases
 *****************************************************************************)

(* Convert a function body into its match arms, assuming it contains a top-level match *)
let funcl_to_arms (FCL_aux (FCL_funcl (id, pexp), _)) =
  let (pat, guard_opt, body_exp, _) = destruct_pexp pexp in
  (* TODO: validate pat? *)
  (match guard_opt with
  | None -> ()
  | Some _ -> failwith ("Function structure error in " ^ string_of_id id ^ ": Unexpected guard in function header"));
  match body_exp with
  | E_aux (E_match (_, arms), _) -> arms
  | _ -> failwith ("Function structure error in " ^ string_of_id id ^ ": Function doesn't contain top-level match")

(* Find the ONLY encoding mapping definition, extract its top-level pattern match,
   ensure each arm constructs an instruction id, convert to (id, pexp) pairs
   and then group by id *)
let find_encodings regex encoding_id ast =
  let encdec_functions = find_funcls ast encoding_id in
  (match encdec_functions with
  | [x] -> funcl_to_arms x
  | [] -> failwith ("Configuration error: No mapping function: " ^ string_of_id encoding_id)
  | _ -> failwith ("Configuration error: Multiple mapping functions: " ^ string_of_id encoding_id)) |>
  List.filter_map (fun pexp ->
    let (_, _, body, _) = destruct_pexp pexp in
    let (id,_) = dest_exp_constructor body in
    if test_regex regex (string_of_id id) then None else Some (id, pexp)
  ) |> assoc_to_binding

(****************************************************************************
 * __instruction Function Generation
 *****************************************************************************)

(* Generate __instruction function that accepts a bitvector and calls execute with constructor *)
let generate_instruction exec_id rty instr_id encoding_index encoding =
  let fun_id = instruction_of_id_index instr_id encoding_index in
  let (opcode_pat, guard_opt, constr, _) = destruct_pexp encoding in
  let loc = pat_loc opcode_pat in
  let env = env_of_pat opcode_pat in

  (* Create function param for opcode, inject into environment so type-checking still works *)
  let opcode_typ = typ_of_pat opcode_pat in
  let opcode_id = mk_id "opcode" in
  let extended_env = Env.add_local opcode_id (Immutable, opcode_typ) env in

  (* Use the provided return type from execute function *)
  let param_tannot = mk_tannot extended_env opcode_typ in
  let rty_tannot = mk_tannot extended_env rty in

  (* Build the execute, match arm, match expression and function body incrementally *)
  let execute_call = E_aux (E_app (exec_id, [constr]), (loc, rty_tannot)) in
  let match_arm = construct_pexp (opcode_pat, guard_opt, execute_call, (loc, rty_tannot)) in
  let match_var = E_aux (E_id opcode_id, (loc, param_tannot)) in
  let match_body = E_aux (E_match (match_var, [match_arm]), (loc, rty_tannot)) in
  let fun_param = P_aux (P_typ (opcode_typ,
    P_aux (P_id opcode_id, (loc, param_tannot))), (loc, param_tannot)) in
  let fun_body = construct_pexp (fun_param, None, match_body, (loc, rty_tannot)) in

  (* Build typed function clause *)
  let def_annot = mk_def_annot loc (), rty_tannot in
  let fun_clause = FCL_aux (FCL_funcl (fun_id, fun_body), def_annot) in

  (* Build function definition with typed annotations *)
  let func_def = FD_aux (FD_function (Rec_aux (Rec_nonrec, loc),
                                      Typ_annot_opt_aux (Typ_annot_opt_some (
                                        TypQ_aux (TypQ_no_forall, loc),
                                        rty),
                                       loc),
                                      [fun_clause]), (loc, rty_tannot)) in

  (fun_id, DEF_aux (DEF_fundef func_def, mk_def_annot loc extended_env))

(* Generate all instruction functions for an instruction *)
let generate_instructions exec_id rty instr_id encodings =
  List.mapi (generate_instruction exec_id rty instr_id) encodings

(****************************************************************************
 * Combined Analysis and Generation
 *****************************************************************************)

let generate_instructions ast =
  let regex = Str.regexp !opt_instruction_filter in
  let exec = mk_id !opt_execute_function_name in
  let enc = mk_id !opt_encdec_function_name in

  (* Find execute functions, implementing instruction behaviour *)
  let rtys = List.map (rty_of_funcl) (find_funcls ast exec) in
  let rty = match rtys with
  | [] -> failwith ("Configuration error: Could not get return type for function: " ^ string_of_id exec)
  | ty :: _ -> ty
  in

  (* Generate instruction bodies for each encoding, add to ast and collect ids for later use *)
  let encodings = find_encodings regex enc ast in
  let insts = Bindings.mapi (generate_instructions exec rty) encodings |> range |> List.flatten in
  let ast = { ast with defs = ast.defs @ List.map snd insts } in
  let roots = NodeSet.of_list (List.map (fun (id,_) -> Function id) insts) in
  (roots, ast)
