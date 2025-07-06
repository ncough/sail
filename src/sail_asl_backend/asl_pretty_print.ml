open Libsail

open Ast
open Ast_defs
open Ast_util
open Asl_exp
open Asl_context
open Asl_extraction
open PPrint
open Interactive.State

(****************************************************************************
 * Instruction Block Generation
 *****************************************************************************)

(* Generate a single encoding block *)
let generate_encoding_block info =
  let encoding_name = info.inst in
  let arch = !opt_architecture_name in

  (* Generate components with proper nesting *)
  let instruction_set_doc = string ("__instruction_set " ^ arch ^ "") ^^ hardline in
  let field_docs = List.map (fun (id, pos, width) ->
    string (Printf.sprintf "__field %s %d +: %d" (Asl_exp.escape_asl_id id) pos width) ^^ hardline
  ) info.fields in
  let opcode_doc = string ("__opcode '" ^ info.mask ^ "'") ^^ hardline in
  let guard_doc = match info.guard with
    | None -> string "__guard TRUE" ^^ hardline
    | Some guard ->
        match pp_exp guard with
        | Ok g -> string "__guard" ^^ space ^^ g ^^ hardline
        | Error msg -> failwith msg
  in
  let decode_doc = string "__decode" ^^ nest 4 (hardline) ^^ hardline in

  (* Combine all components in the specified order *)
  let encoding_header = string ("__encoding " ^ encoding_name) in
  let components = nest 4 (hardline ^^
    instruction_set_doc ^^ concat field_docs ^^ opcode_doc ^^ guard_doc ^^ decode_doc) in

  encoding_header ^^ components

let generate_execute_block info =
  match pp_instruction_stmts info.body with
  | Ok body -> string "__execute" ^^ nest 4 (hardline ^^ body)
  | Error msg -> failwith msg

(* Generate a complete instruction block with all its encodings *)
let generate_instruction_block encoding =
  let inst_name = encoding.inst in
  let header = string ("__instruction " ^ inst_name) in
  let encoding_block = generate_encoding_block encoding in
  let execute_block = generate_execute_block encoding in
  header ^^
    nest 4 (hardline ^^ encoding_block) ^^
    nest 4 (hardline ^^ execute_block)

(* Generate instructions file *)
let generate_instructions_file infos =
  let instruction_blocks = List.map (fun encoding ->
    generate_instruction_block encoding
  ) infos in

  let header_doc =
    string "// Generated ASL instruction definitions" ^^ hardline ^^ hardline
  in

  let blocks_doc = separate (hardline ^^ hardline) instruction_blocks in
  header_doc ^^ blocks_doc ^^ hardline

(****************************************************************************
 * Decode Tree Generation
 *****************************************************************************)

(* Generate decode tree file with opcode organization *)
let generate_decode_file info =
  let opcode_width = String.length (List.hd info).mask in
  let decode_header =
    string "// Generated ASL decode tree" ^^ hardline ^^ hardline ^^
    string ("__decode " ^ !opt_architecture_name) ^^ hardline ^^
    string (Printf.sprintf "    case (%d +: %d) of" 0 opcode_width) ^^ hardline
  in

  (* Generate when clauses for each instruction *)
  let when_clauses = List.map (fun info ->
    let mask_pattern = "'" ^ info.mask ^ "'" in
    let when_line = Printf.sprintf "        when (%s) => __encoding %s" mask_pattern info.inst in
    string when_line ^^ hardline
  ) info in

  let term = string "        when (_) => __UNALLOCATED" ^^ hardline in

  (* Combine all parts *)
  decode_header ^^ concat when_clauses ^^ term ^^ hardline

(****************************************************************************
 * Support File Generation
 *****************************************************************************)

(* Guard functions to determine whether definitions should be printed *)
let include_fundef (fdef: 'a fundef) =
  let func_id = id_of_fundef fdef in
  not (Asl_structure_analysis.is_instruction_function (string_of_id func_id)) &&
  not (Asl_context.is_unsupported_function func_id) &&
  not (Asl_context.is_external_function func_id)

let include_external_fundef (fdef: 'a fundef) =
  let func_id = id_of_fundef fdef in
  not (Asl_structure_analysis.is_instruction_function (string_of_id func_id)) &&
  Asl_context.is_external_function func_id

let include_typedef (tdef: 'a type_def) =
  let type_id = id_of_type_def tdef in
  not (Asl_context.is_external_type type_id)

let include_regdef (rdef: 'a dec_spec) =
  let reg_id = id_of_dec_spec rdef in
  not (Asl_context.is_external_register reg_id)

let include_letdef (letbind: 'a letbind) =
  let (LB_aux (LB_val (pat, _), _)) = letbind in
  let let_ids = pat_ids pat in
  not (IdSet.exists Asl_context.is_external_let let_ids)

(* Helper to convert IdSet to string *)
let idset_to_string ids =
  ids |> IdSet.elements |> List.map string_of_id |> String.concat ", "

(* Helper to get a human-readable definition type name *)
let def_type_name def = match def with
  | DEF_aux (DEF_type _, _) -> "type definition"
  | DEF_aux (DEF_constraint _, _) -> "constraint"
  | DEF_aux (DEF_fundef _, _) -> "function definition"
  | DEF_aux (DEF_mapdef _, _) -> "mapping definition"
  | DEF_aux (DEF_impl _, _) -> "impl definition"
  | DEF_aux (DEF_let _, _) -> "let definition"
  | DEF_aux (DEF_val _, _) -> "val specification"
  | DEF_aux (DEF_outcome (_, _), _) -> "outcome definition"
  | DEF_aux (DEF_instantiation (_, _), _) -> "instantiation"
  | DEF_aux (DEF_fixity (_, _, _), _) -> "fixity declaration"
  | DEF_aux (DEF_overload (_, _), _) -> "overload specification"
  | DEF_aux (DEF_default _, _) -> "default specification"
  | DEF_aux (DEF_scattered _, _) -> "scattered definition"
  | DEF_aux (DEF_measure (_, _, _), _) -> "measure declaration"
  | DEF_aux (DEF_loop_measures (_, _), _) -> "loop measures declaration"
  | DEF_aux (DEF_register _, _) -> "register declaration"
  | DEF_aux (DEF_internal_mutrec _, _) -> "internal mutrec definition"
  | DEF_aux (DEF_pragma (_, _), _) -> "pragma directive"

(* Translate a single definition and warn about unsupported ones *)
let translate_definition def =
  let def_ids = ids_of_def def in
  let def_id_str = idset_to_string def_ids in
  let def_type = def_type_name def in
  match def with
  | DEF_aux (DEF_fundef fdef, _) when include_external_fundef fdef ->
      (match pp_fundef_signature fdef with
      | Error msg ->
          Printf.printf "Warning: Skipping external function signature %s: %s\n" def_id_str msg;
          None
      | Ok doc -> Some doc)
  | DEF_aux (DEF_fundef fdef, _) when include_fundef fdef ->
      (match pp_fundef fdef with
      | Error msg ->
          Printf.printf "Warning: Skipping function %s: %s\n" def_id_str msg;
          None
      | Ok doc -> Some doc)
  | DEF_aux (DEF_fundef fdef, _) -> None
  | DEF_aux (DEF_type tdef, _) when include_typedef tdef ->
      (match pp_typedef tdef with
      | Error msg ->
          Printf.printf "Warning: Skipping type definition %s: %s\n" def_id_str msg;
          None
      | Ok doc -> Some doc)
  | DEF_aux (DEF_type tdef, _)  -> None
  | DEF_aux (DEF_register rdef, _) when include_regdef rdef ->
      (match pp_regdef rdef with
      | Error msg ->
          Printf.printf "Warning: Skipping register definition %s: %s\n" def_id_str msg;
          None
      | Ok doc -> Some doc)
  | DEF_aux (DEF_register rdef, _) -> None
  | DEF_aux (DEF_let letbind, _) when include_letdef letbind ->
      (match pp_letdef letbind with
      | Error msg ->
          Printf.printf "Warning: Skipping let definition %s: %s\n" def_id_str msg;
          None
      | Ok doc -> Some doc)
  | DEF_aux (DEF_let letbind, _) -> None
  (* Explicitly ignore value, pragma, overload *)
  | DEF_aux (DEF_val _, _) -> None
  | DEF_aux (DEF_pragma _, _) -> None
  | DEF_aux (DEF_overload _, _) -> None
  | DEF_aux (DEF_default _, _) -> None
  | DEF_aux (DEF_fixity _, _) -> None
  | _ ->
      let id_part = if String.length def_id_str > 0 then " " ^ def_id_str else "" in
      Printf.printf "Warning: Skipping unsupported definition (%s)%s\n" def_type id_part;
      None

(* Generate support file with utility definitions *)
let generate_support_file ictx =
  let header_doc = string "// Generated ASL support definitions" ^^ hardline ^^ hardline in
  let function_docs = List.filter_map translate_definition ictx.ast.defs in
  header_doc ^^ separate (hardline ^^ hardline) function_docs ^^ hardline

(****************************************************************************
 * Main Pretty Printing Interface
 *****************************************************************************)

(* Generate all ASL files from instruction_infos *)
let generate_asl_files basename info ictx =

  (* Create PPrint documents *)
  let instructions_doc = generate_instructions_file info in
  let decode_doc = generate_decode_file info in
  let support_doc = generate_support_file ictx in

  (* Return filename, document pairs *)
  [
    (basename ^ "_instrs.asl", instructions_doc);
    (basename ^ "_decode.asl", decode_doc);
    (basename ^ "_support.asl", support_doc);
  ]
