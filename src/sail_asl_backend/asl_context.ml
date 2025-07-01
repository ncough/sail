open Libsail

open Ast
open Ast_util
open Ast_defs
open Type_check

(***************************************************************************************************
 * External Definitions Registry
 **************************************************************************************************)

(* We implement these in the prelude or by mapping to built-in primitives during printing *)
let unsupported_functions = ref (IdSet.of_list [
  mk_id "internal_error";
  mk_id "neq_anything";
  mk_id "bitvector_length";
  mk_id "vector_length";
  mk_id "hex_bits_backwards";
  mk_id "nan_box";
  mk_id "undefined_Privilege";
  Id_aux (Operator "<_u", Unknown);
  Id_aux (Operator ">_u", Unknown);
  Id_aux (Operator ">=_u", Unknown);
  Id_aux (Operator "<=_u", Unknown);
  Id_aux (Operator "<_s", Unknown);
  Id_aux (Operator ">_s", Unknown);
  Id_aux (Operator ">=_s", Unknown);
  Id_aux (Operator "<=_s", Unknown);
])

(* A mix of floating point ops, that we want to exclude, along with problematic functions.
 * These are just printed as their signatures.
 *)
let external_functions = ref (IdSet.of_list [
  (* TODO: Many issues under tlb / memory accesses *)
  mk_id "translate";
  mk_id "flush_TLB";
  mk_id "mem_read_priv";
  mk_id "write_ram";

  (* Floats. Just want high-level prototypes. *)
  mk_id "riscv_f16Add";
  mk_id "riscv_f16Sub";
  mk_id "riscv_f16Mul";
  mk_id "riscv_f16Div";
  mk_id "riscv_f32Add";
  mk_id "riscv_f32Sub";
  mk_id "riscv_f32Mul";
  mk_id "riscv_f32Div";
  mk_id "riscv_f64Add";
  mk_id "riscv_f64Sub";
  mk_id "riscv_f64Mul";
  mk_id "riscv_f64Div";
  mk_id "riscv_f16MulAdd";
  mk_id "riscv_f32MulAdd";
  mk_id "riscv_f64MulAdd";
  mk_id "riscv_f16Sqrt";
  mk_id "riscv_f32Sqrt";
  mk_id "riscv_f64Sqrt";
  mk_id "riscv_f16ToI32";
  mk_id "riscv_f16ToUi32";
  mk_id "riscv_i32ToF16";
  mk_id "riscv_ui32ToF16";
  mk_id "riscv_f16ToI64";
  mk_id "riscv_f16ToUi64";
  mk_id "riscv_i64ToF16";
  mk_id "riscv_ui64ToF16";
  mk_id "riscv_f32ToI32";
  mk_id "riscv_f32ToUi32";
  mk_id "riscv_i32ToF32";
  mk_id "riscv_ui32ToF32";
  mk_id "riscv_f32ToI64";
  mk_id "riscv_f32ToUi64";
  mk_id "riscv_i64ToF32";
  mk_id "riscv_ui64ToF32";
  mk_id "riscv_f64ToI32";
  mk_id "riscv_f64ToUi32";
  mk_id "riscv_i32ToF64";
  mk_id "riscv_ui32ToF64";
  mk_id "riscv_f64ToI64";
  mk_id "riscv_f64ToUi64";
  mk_id "riscv_i64ToF64";
  mk_id "riscv_ui64ToF64";
  mk_id "riscv_f16ToF32";
  mk_id "riscv_f16ToF64";
  mk_id "riscv_f32ToF64";
  mk_id "riscv_f32ToF16";
  mk_id "riscv_f64ToF16";
  mk_id "riscv_f64ToF32";
  mk_id "riscv_f16Lt";
  mk_id "riscv_f16Lt_quiet";
  mk_id "riscv_f16Le";
  mk_id "riscv_f16Le_quiet";
  mk_id "riscv_f16Eq";
  mk_id "riscv_f32Lt";
  mk_id "riscv_f32Lt_quiet";
  mk_id "riscv_f32Le";
  mk_id "riscv_f32Le_quiet";
  mk_id "riscv_f32Eq";
  mk_id "riscv_f64Lt";
  mk_id "riscv_f64Lt_quiet";
  mk_id "riscv_f64Le";
  mk_id "riscv_f64Le_quiet";
  mk_id "riscv_f64Eq";
  mk_id "riscv_f16roundToInt";
  mk_id "riscv_f32roundToInt";
  mk_id "riscv_f64roundToInt";
  mk_id "riscv_f16Rsqrte7";
  mk_id "riscv_f32Rsqrte7";
  mk_id "riscv_f64Rsqrte7";
  mk_id "riscv_f16Recip7";
  mk_id "riscv_f32Recip7";
  mk_id "riscv_f64Recip7";
])

let external_types = ref (IdSet.of_list [
  (* built-in *)
  mk_id "bits";
  mk_id "int";
  mk_id "bool";
  mk_id "exception";
])

let external_registers = ref (IdSet.of_list [
  mk_id "tlb";
])

let external_lets = ref (IdSet.of_list [])

(* Utility functions to check if definitions are unsupported or external *)
let is_unsupported_function id = IdSet.mem id !unsupported_functions
let is_external_function id = IdSet.mem id !external_functions
let is_external_type id = IdSet.mem id !external_types
let is_external_register id = IdSet.mem id !external_registers
let is_external_let id = IdSet.mem id !external_lets

(* Functions to add external definitions (for future mutation) *)
let add_unsupported_function id = unsupported_functions := IdSet.add id !unsupported_functions
let add_external_function id = external_functions := IdSet.add id !external_functions
let add_external_type id = external_types := IdSet.add id !external_types
let add_external_register id = external_registers := IdSet.add id !external_registers
let add_external_let id = external_lets := IdSet.add id !external_lets

(***************************************************************************************************
 * Configuration - Global Mutable Settings
 **************************************************************************************************)

(* Global configuration variables with defaults *)
let opt_architecture_name = ref "R64"
let opt_instruction_filter = ref {|.^|}
let opt_execute_function_name = ref "execute"
let opt_encdec_function_name = ref "encdec_backwards"
let opt_output_dir = ref (None : string option)
let opt_debug_level = ref 0

(***************************************************************************************************
 * Utility Functions
 **************************************************************************************************)

(* Utility to ensure a pattern destructs a constructor *)
let dest_pat_constructor (P_aux (pat, _) as p) =
  match pat with
  | P_app (id, args) -> (id,args)  (* Constructor application like TMStart(_) *)
  | P_id id -> (id, [])            (* Simple constructor like TMCommit *)
  | _ -> failwith ("Pattern analysis error: Not a constructor pattern: " ^ string_of_pat p)

(* Utility to ensure an expression invokes a constructor *)
let dest_exp_constructor (E_aux (exp, _) as e) =
  match exp with
  | E_app (id, args) -> (id,args) (* Constructor application like UTYPE(...) *)
  | E_id id -> (id, [])           (* Simple constructor *)
  | _ -> failwith @@ "No constructor: " ^ (string_of_exp e)

let test_regex regex str =
  Str.string_match regex str 0

let range b = Bindings.bindings b |> List.map snd

let find_fundefs ast id =
  List.filter_map (fun d -> match d with
  | DEF_aux (DEF_fundef f, annot) when is_fundef id d ->
      Some f
  | _ -> None) ast.defs

let find_funcls ast id =
  find_fundefs ast id |>
  List.map (fun (FD_aux (FD_function (_, _, fcls), _)) -> fcls) |>
  List.flatten

let rty_of_funcl (FCL_aux (FCL_funcl (_, pexp), (annot))) =
  match typ_of_annot (Unknown, snd annot) with
  | Typ_aux (Typ_fn (_, ret), _) -> ret
  | t -> t
