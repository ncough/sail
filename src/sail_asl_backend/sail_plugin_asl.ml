open Libsail

open Interactive.State
open Asl_structure_analysis
open Asl_transforms
open Asl_extraction
open Asl_dead_code
open Asl_pretty_print

(***************************************************************************************************
 * CLI Options and Plugin Configuration
 **************************************************************************************************)

let asl_options =
  [
    ( Flag.create ~prefix:["asl"] ~arg:"directory" "output_dir",
      Arg.String (fun dir -> Asl_context.opt_output_dir := Some dir),
      "set a custom directory to output generated asl"
    );
    ( Flag.create ~prefix:["asl"] ~arg:"level" "debug",
      Arg.Int (fun level -> Asl_context.opt_debug_level := level),
      "set debug level (0=none, 1=basic, 2=verbose, 3=full)"
    );
    ( Flag.create ~prefix:["asl"] ~arg:"name" "architecture",
      Arg.String (fun name -> Asl_context.opt_architecture_name := name),
      "set the target architecture name (default: R64)"
    );
    ( Flag.create ~prefix:["asl"] ~arg:"regex" "instruction_filter",
      Arg.String (fun filter -> Asl_context.opt_instruction_filter := filter),
      "set regex pattern to filter instructions (default: .^)"
    );
    ( Flag.create ~prefix:["asl"] ~arg:"name" "execute_function",
      Arg.String (fun name -> Asl_context.opt_execute_function_name := name),
      "set the name of the execute function (default: execute)"
    );
    ( Flag.create ~prefix:["asl"] ~arg:"name" "encdec_function",
      Arg.String (fun name -> Asl_context.opt_encdec_function_name := name),
      "set the name of the encoding/decoding function (default: encdec_backwards)"
    );
  ]

(***************************************************************************************************
 * Utilities
 **************************************************************************************************)

let write_doc directory filename doc =
  let file_info = Util.open_output_with_check ?directory filename in
  Pretty_print_common.print file_info.channel doc;
  Util.close_output_with_check file_info

(* Dump AST to file for debugging *)
let dump_ast directory filename ast =
  let file_info = Util.open_output_with_check ?directory filename in
  (* Convert typed AST to untyped for pretty printing *)
  let untyped_ast = Type_check.strip_ast ast in
  Pretty_print_sail.output_ast file_info.channel untyped_ast;
  Util.close_output_with_check file_info

(* Run arbitrary rewrites *)
let run_rewrites name rw (other, ictx) =
  let rw = Rewrites.instantiate_rewrites rw in
  let (ctx,ast,effect_info,env) =
    Rewrites.rewrite ictx.ctx ictx.effect_info ictx.env rw ictx.ast in
  (other, {ictx with ctx ; ast; env; effect_info })

let run_ast_transform name tf (other, ictx) =
  let ast = tf ictx.ast in
  (other, {ictx with ast})

let run_info_ast_transform name tf (info, ictx) =
  let (info,ast) = tf info ictx.ast in
  (info, {ictx with ast})

(* Dump the AST for debugging *)
let _dump_ast phase_name (other, ictx) =
  let filename = Printf.sprintf "debug_%s.sail" phase_name in
  dump_ast !Asl_context.opt_output_dir filename ictx.ast;
  (other, ictx)

(* Toggle TC verbosity to debug type errors *)
let _set_tc_debug i =
  Type_check.set_tc_debug 1;
  i

(***************************************************************************************************
 * Phases
 **************************************************************************************************)

let early_rewrites =
  let open Rewrites in [
    ("move_termination_measures", []);
    ("instantiate_outcomes", [String_arg "lem"]);
    ("realize_mappings", []);
  ]

let lowering_rewrites2 =
  let open Rewrites in [
    ("remove_vector_subrange_pats", []);
    ("remove_duplicate_valspecs", []);
    ("toplevel_string_append", []);
    ("pat_string_append", []);
    ("mapping_patterns", []);
    ("undefined", [Bool_arg false]);
    ("vector_string_pats_to_bit_list", []);
    ("remove_not_pats", []);
    ("remove_impossible_int_cases", []);
    ("tuple_assignments", []);
    ("vector_concat_assignments", []);
    ("simple_assignments", []);
    ("remove_vector_concat", []);
    ("remove_bitvector_pats", []);
    ("pattern_literals", [Literal_arg "asl"]);
    ("guarded_pats", []);
    (* ("register_ref_writes", rewrite_register_ref_writes); *)
    ("nexp_ids", []);
    ("remove_bitfield_records", []);
    ("recheck_defs", []);
    (* Put prover regstate generation after removing bitfield records,
       which has to be followed by type checking *)
    ("top_sort_defs", []);
    ("const_prop_mutrec", [String_arg "lem"]);
    ("vector_string_pats_to_bit_list", []);
    ("exp_lift_assign", []);
    (*("early_return", []);*)
    (* early_return currently breaks the types *)
    ("recheck_defs", []);
    (* merge funcls before adding the measure argument so that it doesn't
       disappear into an internal pattern match *)
    ("merge_function_clauses", []);
    ("recheck_defs", []);
    ("rewrite_explicit_measure", []);
    ("recheck_defs", []);
    ("remove_superfluous_letbinds", []);
    ("remove_superfluous_returns", []);
    ("merge_function_clauses", []);
    ("bit_lists_to_lits", []);
    ("recheck_defs", []);
  ]

let generate_asl_stubs ictx =
  let (roots, ast) = generate_instructions ictx.ast in
  (roots, {ictx with ast})

let run_extraction (roots, ictx) =
  let ast = apply_asl_decode_transforms ictx.ast in
  let info = extract_instructions ast in
  (info, {ictx with ast})

let pretty_print basename (info, ictx) =
  generate_asl_files basename info ictx

(***************************************************************************************************
 * Plugin Interface
 **************************************************************************************************)

let asl_target out_file ictx =
  let basename = match out_file with Some f -> f | None -> "out" in
  let asl_files =
    (* Inject __instruction stubs and lower a little *)
    generate_asl_stubs ictx
    |> run_rewrites "Rewrites1" [
      ("mapping_patterns", []);
      ("recheck_defs", []);
      ("split", [String_arg "execute"]);
      ("recheck_defs", []);
    ]

    (* Change ids throughout the IR so that X is an escape char + names are valid for ASL *)
    |> run_ast_transform "EscapeVar" escape_var_names
    |> run_rewrites "EscapeVar_TC" [("recheck_defs", [])]

    (* Extract the __instruction stubs *)
    |> run_extraction

    (* Do the rest of the lowering *)
    |> run_rewrites "Rewrites2" lowering_rewrites2

    (* Early deadcode to simplify elimination *)
    |> run_ast_transform "Deadcode1" (eliminate_dead_code false)
    |> run_rewrites "Deadcode1_TC" [("recheck_defs", [])]

    (* Cleanup: eliminate newtypes, unions, records, strided for loops, match expressions *)
    |> run_ast_transform "NewtypeElim" eliminate_newtypes
    |> run_rewrites "NewtypeElim_TC" [("recheck_defs", [])]
    |> run_ast_transform "UnionElim" eliminate_unions
    |> run_rewrites "UnionElim_TC" [("recheck_defs", [])]
    |> run_ast_transform "RecordElim" eliminate_records
    |> run_rewrites "RecordElim_TC" [("recheck_defs", [])]
    |> run_ast_transform "MatchBindElim" eliminate_match_expressions
    |> run_rewrites "MatchBindElim_TC" [("recheck_defs", [])]
    |> run_info_ast_transform "TypeAliasElim" eliminate_type_aliases
    |> run_rewrites "TypeAliasElim_TC" [("recheck_defs", [])]
    |> run_ast_transform "TupleCollapse" collapse_tuples
    |> run_rewrites "TupleCollapse_TC" [("recheck_defs", [])]
    |> run_ast_transform "ForLoopNorm" normalize_for_loop_strides

    (* Finally, a more aggressive deadcode and output *)
    |> run_ast_transform "Deadcode2" (eliminate_dead_code true)
    |> pretty_print basename
  in
  List.iter (fun (filename, doc) -> write_doc !Asl_context.opt_output_dir filename doc) asl_files

let _ = Target.register ~name:"asl" ~options:asl_options ~rewrites:early_rewrites asl_target
