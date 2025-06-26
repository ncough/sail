open Libsail

open Ast
open Ast_defs
open Ast_util
open Callgraph
open Asl_context

(****************************************************************************
 * ASL Dead Code Elimination
 *
 * This module provides dead code elimination for the ASL backend using
 * callgraph-based dependency analysis with configurable cut functions.
 * Uses the provided roots as analysis seeds and filters the AST based on
 * reachability analysis.
 *****************************************************************************)

(****************************************************************************
 * Utility Functions
 *****************************************************************************)

let cut_set_from_externals () =
  let unsupported_function_cuts = IdSet.fold (fun id acc ->
    NodeSet.add (Function id) acc
  ) !unsupported_functions NodeSet.empty in
  let external_function_cuts = IdSet.fold (fun id acc ->
    NodeSet.add (Function id) acc
  ) !external_functions unsupported_function_cuts in
  let type_cuts = IdSet.fold (fun id acc ->
    NodeSet.add (Type id) acc
  ) !external_types external_function_cuts in
  let register_cuts = IdSet.fold (fun id acc ->
    NodeSet.add (Register id) acc
  ) !external_registers type_cuts in
  let let_cuts = IdSet.fold (fun id acc ->
    NodeSet.add (Letbind id) acc
  ) !external_lets register_cuts in
  let_cuts

(****************************************************************************
 * Main Dead Code Elimination
 *****************************************************************************)

(* Collect instruction function IDs from AST definitions *)
let collect_instruction_function_roots ast =
  let collect_from_def = function
    | DEF_aux (DEF_fundef fdef, _) ->
        let func_id = id_of_fundef fdef in
        let func_name = string_of_id func_id in
        if Asl_structure_analysis.is_instruction_function func_name then
          Some (Function func_id)
        else
          None
    | _ -> None
  in
  let instruction_nodes = List.filter_map collect_from_def ast.defs in
  NodeSet.of_list instruction_nodes

(* Perform dead code elimination using instruction functions as roots *)
let eliminate_dead_code cut ast =
  (* Build full callgraph from the AST *)
  let full_graph = graph_of_ast ast in
  (* Automatically derive roots from instruction functions *)
  let seed_nodes = collect_instruction_function_roots ast in
  let cut_nodes = if cut then cut_set_from_externals () else NodeSet.empty in

  (* Find all reachable nodes, stopping at cuts *)
  let cut_graph = G.prune seed_nodes cut_nodes full_graph in

  (* Filter AST definitions based on reachability *)
  filter_ast NodeSet.empty cut_graph ast
