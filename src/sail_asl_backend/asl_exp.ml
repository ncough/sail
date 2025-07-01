open Libsail

open Ast
open Ast_util
open Type_check
open PPrint

let to_string = Pretty_print_sail.Document.to_string

let block stmts = nest 4 (hardline ^^ separate hardline stmts)

let unit_lit_doc = string "() UNKNOWN"
let false_doc = string "FALSE"
let wild_doc = string "-"

let tuple_doc args = parens (separate (comma ^^ space) args)

let unknown_exp typ = typ ^^ space ^^ string "UNKNOWN"

let if_else_stmt cond tbody fbody =
  let istmt = string "if" ^^ space ^^ cond ^^ space ^^ string "then" in
  let estmt = string "else" in
  istmt ^^ block tbody ^^ hardline ^^ estmt ^^ block fbody

let if_stmt cond body =
  let istmt = string "if" ^^ space ^^ cond ^^ space ^^ string "then" in
  istmt ^^ block body

let for_stmt var start stop dir body =
  let var_decl = var ^^ space ^^ equals ^^ space ^^ start ^^ space ^^ dir ^^ space ^^ stop in
  string "for" ^^ space ^^ var_decl ^^ block body

let repeat_stmt body cond =
  string "repeat" ^^ block body ^^ hardline ^^ string "until" ^^ space ^^ cond ^^ semi

let const_stmt typ var exp =
  string "constant" ^^ space ^^ typ ^^ space ^^ var ^^ space ^^ equals ^^ space ^^ exp ^^ semi

let var_decl_stmt typ var =
  typ ^^ space ^^ var ^^ semi

let var_stmt typ var exp =
  typ ^^ space ^^ var ^^ space ^^ equals ^^ space ^^ exp ^^ semi

let assign_stmt var exp =
  var ^^ space ^^ equals ^^ space ^^ exp ^^ semi

let return_stmt arg =
  if arg = unit_lit_doc then
    (string "return" ^^ semi)
  else
    (string "return" ^^ space ^^ arg ^^ semi)

let assert_stmt arg =
  string "assert" ^^ parens arg ^^ semi

let mul_op arg1 arg2 =
  parens arg1 ^^ space ^^ string "*" ^^ space ^^ parens arg2
let sub_op arg1 arg2 =
  parens arg1 ^^ space ^^ string "-" ^^ space ^^ parens arg2
let add_op arg1 arg2 =
  parens arg1 ^^ space ^^ string "+" ^^ space ^^ parens arg2
let div_op arg1 arg2 =
  parens arg1 ^^ space ^^ string "DIV" ^^ space ^^ parens arg2

let pow2_uop arg =
  string "pow2_int" ^^ parens arg
let neg_uop arg =
  string "-" ^^ parens arg

let if_expr cond arg1 arg2 =
  parens (string "if" ^^ space ^^ cond ^^ space ^^ string "then" ^^ space ^^ arg1 ^^ space ^^ string "else" ^^
  space ^^ arg2)

let basic_call name args = (string name ^^ parens (separate (comma ^^ space) args))

let rec call_doc name args =
  match (name, args) with
  (* These are used in types, need to convert directly to primitives to help type checking *)
  | ("pow2", [arg]) ->
      (string "pow2_int" ^^ parens arg)
  | ("mult_atom", [arg1; arg2]) ->
      (parens arg1 ^^ space ^^ string "*" ^^ space ^^ parens arg2)
  | ("sub_atom",  [arg1; arg2]) ->
      (arg1 ^^ space ^^ string "-" ^^ space ^^ parens arg2)
  | ("add_atom",  [arg1; arg2]) ->
      (arg1 ^^ space ^^ string "+" ^^ space ^^ arg2)
  | ("negate_atom",  [arg1]) ->
      (string "-" ^^ parens arg1)
  | ("ediv_int", [arg1; arg2]) ->
      div_op arg1 arg2
  | ("__id",  [arg]) ->
      (arg)
  | ("vector_length", [_; arg2; _]) -> arg2

  (* Translate infix syntax *)
  | ("(operator >=_u)", _) ->
      call_doc "uge_bits" args
  | ("(operator <=_u)", _) ->
      call_doc "ule_bits" args
  | ("(operator <_u)", _) ->
      call_doc "ult_bits" args
  | ("(operator >_u)", _) ->
      call_doc "ugt_bits" args
  | ("(operator >=_s)", _) ->
      call_doc "sge_bits" args
  | ("(operator <=_s)", _) ->
      call_doc "sle_bits" args
  | ("(operator <_s)", _) ->
      call_doc "slt_bits" args
  | ("(operator >_s)", _) ->
      call_doc "sgt_bits" args

  (* Explicit cast to these functions *)
  | ("negate_H", [arg])
  | ("f_is_neg_zero_H", [arg])
  | ("f_is_pos_zero_H", [arg])
  | ("f_is_neg_inf_H", [arg])
  | ("f_is_neg_norm_H", [arg])
  | ("f_is_neg_subnorm_H", [arg])
  | ("f_is_pos_subnorm_H", [arg])
  | ("f_is_pos_norm_H", [arg])
  | ("f_is_pos_inf_H", [arg])
  | ("f_is_SNaN_H", [arg])
  | ("f_is_QNaN_H", [arg])
  | ("f_is_NaN_H", [arg]) ->
      basic_call name [arg ^^ string "[15:0]"]

  | ("Mk_Satp32", [arg])
  | ("negate_S", [arg])
  | ("f_is_neg_zero_S", [arg])
  | ("f_is_pos_zero_S", [arg])
  | ("f_is_neg_inf_S", [arg])
  | ("f_is_neg_norm_S", [arg])
  | ("f_is_neg_subnorm_S", [arg])
  | ("f_is_pos_subnorm_S", [arg])
  | ("f_is_pos_norm_S", [arg])
  | ("f_is_pos_inf_S", [arg])
  | ("f_is_SNaN_S", [arg])
  | ("f_is_QNaN_S", [arg])
  | ("f_is_NaN_S", [arg]) ->
      basic_call name [arg ^^ string "[31:0]"]

  | ("Mk_Satp64", [arg])
  | ("negate_D", [arg])
  | ("f_is_neg_zero_D", [arg])
  | ("f_is_pos_zero_D", [arg])
  | ("f_is_neg_inf_D", [arg])
  | ("f_is_neg_norm_D", [arg])
  | ("f_is_neg_subnorm_D", [arg])
  | ("f_is_pos_subnorm_D", [arg])
  | ("f_is_pos_norm_D", [arg])
  | ("f_is_pos_inf_D", [arg])
  | ("f_is_SNaN_D", [arg])
  | ("f_is_QNaN_D", [arg])
  | ("f_is_NaN_D", [arg]) ->
      basic_call name [arg ^^ string "[63:0]"]

  | ("riscv_f16Sqrt", [rm; op])
  | ("riscv_f16Rsqrte7", [rm; op])
  | ("riscv_f16Recip7", [rm; op])
  | ("riscv_f16ToF32", [rm; op]) ->
      basic_call name [rm; op ^^ string "[15:0]"]

  | ("riscv_f32Sqrt", [rm; op])
  | ("riscv_f32Rsqrte7", [rm; op])
  | ("riscv_f32Recip7", [rm; op])
  | ("riscv_f32ToF64", [rm; op]) ->
      basic_call name [rm; op ^^ string "[31:0]"]

  | ("riscv_f64Sqrt", [rm; op]) 
  | ("riscv_f64Rsqrte7", [rm; op])
  | ("riscv_f64Recip7", [rm; op]) ->
      basic_call name [rm; op ^^ string "[63:0]"]

  | ("riscv_f16Add", [rm; op1; op2])
  | ("riscv_f16Sub", [rm; op1; op2])
  | ("riscv_f16Mul", [rm; op1; op2])
  | ("riscv_f16Div", [rm; op1; op2]) ->
      basic_call name [rm; op1 ^^ string "[15:0]"; op2 ^^ string "[15:0]"]

  | ("riscv_f32Add", [rm; op1; op2])
  | ("riscv_f32Sub", [rm; op1; op2])
  | ("riscv_f32Mul", [rm; op1; op2])
  | ("riscv_f32Div", [rm; op1; op2]) ->
      basic_call name [rm; op1 ^^ string "[31:0]"; op2 ^^ string "[31:0]"]

  | ("riscv_f64Add", [rm; op1; op2])
  | ("riscv_f64Sub", [rm; op1; op2])
  | ("riscv_f64Mul", [rm; op1; op2])
  | ("riscv_f64Div", [rm; op1; op2]) ->
      basic_call name [rm; op1 ^^ string "[63:0]"; op2 ^^ string "[63:0]"]

  | ("riscv_f16Lt_quiet", [op1; op2]) 
  | ("riscv_f16Le", [op1; op2]) 
  | ("riscv_f16Lt", [op1; op2]) 
  | ("riscv_f16Eq", [op1; op2]) ->
      basic_call name [op1 ^^ string "[15:0]"; op2 ^^ string "[15:0]"]

  | ("riscv_f32Lt_quiet", [op1; op2]) 
  | ("riscv_f32Le", [op1; op2]) 
  | ("riscv_f32Lt", [op1; op2]) 
  | ("riscv_f32Eq", [op1; op2]) ->
      basic_call name [op1 ^^ string "[31:0]"; op2 ^^ string "[31:0]"]

  | ("riscv_f64Lt_quiet", [op1; op2]) 
  | ("riscv_f64Le", [op1; op2]) 
  | ("riscv_f64Lt", [op1; op2]) 
  | ("riscv_f64Eq", [op1; op2]) ->
      basic_call name [op1 ^^ string "[63:0]"; op2 ^^ string "[63:0]"]

  | ("riscv_f16MulAdd", [rm; op1; op2; op3]) ->
      basic_call name [rm; op1 ^^ string "[15:0]"; op2 ^^ string "[15:0]"; op3 ^^ string "[15:0]"]

  | ("riscv_f32MulAdd", [rm; op1; op2; op3]) ->
      basic_call name [rm; op1 ^^ string "[31:0]"; op2 ^^ string "[31:0]"; op3 ^^ string "[31:0]"]

  | ("riscv_f64MulAdd", [rm; op1; op2; op3]) ->
      basic_call name [rm; op1 ^^ string "[63:0]"; op2 ^^ string "[63:0]"; op3 ^^ string "[63:0]"]

  (* Translate poly equality and inequality *)
  | ("eq_anything", [arg1; arg2]) ->
      (arg1 ^^ space ^^ string "==" ^^ space ^^ arg2)
  | ("neq_anything", [arg1; arg2]) ->
      (arg1 ^^ space ^^ string "!=" ^^ space ^^ arg2)

  | (_, [arg]) when arg = unit_lit_doc ->
      (string name ^^ parens empty)
  | _ ->
      (string name ^^ parens (separate (comma ^^ space) args))

let vec_ops = [
  ("vector_length", 0);
  ("plain_vector_access", 0);
  ("get_velem_quad", 0);
  ("get_velem_quad_vec", 0);
  ("vrev8", 1);
  ("get_velem_oct_vec", 1);
]

(*******************************************************************************
 * Type Resolution Helpers
 ******************************************************************************)

(* Helper function to resolve type aliases, newtypes, and determine if a type is ultimately a bitvector with its width *)
let rec resolve_bitvector_width env typ =
  match typ with
  | Typ_aux (Typ_app (type_id, [A_aux (A_nexp width_nexp, _)]), _)
    when string_of_id type_id = "bitvector" || string_of_id type_id = "bits" ->
      Some width_nexp
  | Typ_aux (Typ_app (type_id, [A_aux (A_nexp size_nexp, _); A_aux (A_typ elem_typ, _)]), _)
    when string_of_id type_id = "vector" ->
      (* Handle vector(N, bitvector(M)) -> compute total width as M * N *)
      (match resolve_bitvector_width env elem_typ with
      | Some elem_width_nexp ->
          (* Create multiplication expression: elem_width * size *)
          Some (Nexp_aux (Nexp_times (elem_width_nexp, size_nexp), Parse_ast.Unknown))
      | None -> None)
  | Typ_aux (Typ_id type_id, _) ->
      (* Check if this is a newtype first *)
      if Env.is_newtype type_id env then
        (try
          let all_variants = Env.get_variants env in
          (match Bindings.find_opt type_id all_variants with
          | Some (typquant, constructors) ->
              (* Newtypes should have exactly one constructor *)
              (match constructors with
              | [Tu_aux (Tu_ty_id (underlying_typ, _), _)] ->
                  (* Found newtype, resolve underlying type recursively *)
                  resolve_bitvector_width env underlying_typ
              | _ -> None (* Not a proper newtype structure *))
          | None -> None)
        with _ -> None)
      else
        (* Try to resolve type alias through environment *)
        (try
          let synonyms = Env.get_typ_synonyms env in
          let (typquant, alias_typ_arg) = Bindings.find type_id synonyms in
          (* Extract type from type argument *)
          (match alias_typ_arg with
          | A_aux (A_typ alias_typ, _) ->
              (* Found type alias, resolve recursively *)
              resolve_bitvector_width env alias_typ
          | _ -> None)
        with _ ->
          (* Not found in environment *)
          None)
  | Typ_aux (Typ_app (alias_id, args), _) ->
      (* Try to resolve parameterized type alias *)
      (try
        let synonyms = Env.get_typ_synonyms env in
        let (_, _) = Bindings.find alias_id synonyms in
        (* For now, just return None for parameterized aliases *)
        (* TODO: Substitute type parameters if needed *)
        None
      with _ ->
        None)
  | _ -> None

(* Helper function to resolve vector size from vector types through aliases/newtypes *)
let rec resolve_vector_size env typ =
  match typ with
  | Typ_aux (Typ_app (type_id, [A_aux (A_nexp size_nexp, _); A_aux (A_typ typ, _)]), _)
    when string_of_id type_id = "vector" ->
      (match resolve_bitvector_width env typ with
      | Some width -> Some (size_nexp, width)
      | None -> None)
  | Typ_aux (Typ_id type_id, _) ->
      (* Check if this is a newtype first *)
      if Env.is_newtype type_id env then
        (try
          let all_variants = Env.get_variants env in
          (match Bindings.find_opt type_id all_variants with
          | Some (typquant, constructors) ->
              (* Newtypes should have exactly one constructor *)
              (match constructors with
              | [Tu_aux (Tu_ty_id (underlying_typ, _), _)] ->
                  (* Found newtype, resolve underlying type recursively *)
                  resolve_vector_size env underlying_typ
              | _ -> None (* Not a proper newtype structure *))
          | None -> None)
        with _ -> None)
      else
        (* Try to resolve type alias through environment *)
        (try
          let synonyms = Env.get_typ_synonyms env in
          let (typquant, alias_typ_arg) = Bindings.find type_id synonyms in
          (* Extract type from type argument *)
          (match alias_typ_arg with
          | A_aux (A_typ alias_typ, _) ->
              (* Found type alias, resolve recursively *)
              resolve_vector_size env alias_typ
          | _ -> None)
        with _ ->
          (* Not found in environment *)
          None)
  | _ -> None

(****************************************************************************
 * ASL Variable Name Escaping
 ******************************************************************************)

(* Escape ASL-incompatible characters in variable names *)
let escape_asl_name name =
  Str.global_replace (Str.regexp "#") "XH" name

(* Escape a SAIL identifier for use in ASL *)
let escape_asl_id id = escape_asl_name (string_of_id id)
let escape_asl_kid kid =
  match string_of_kid kid with
  (* TODO: I do not know why this is necessary *)
  | "'_#VLEN_pow" -> "VLEN_pow"
  | "'n#0" -> "n"
  | kid_str ->
      let stripped = if String.length kid_str > 0 && kid_str.[0] = '\'' then
        String.sub kid_str 1 (String.length kid_str - 1)
      else
        kid_str
      in
      (escape_asl_name stripped)

let id_doc id = string (escape_asl_id id)

(* Counter for generating fresh variable names *)
let fresh_counter = ref 0

(* Generate a fresh variable name *)
let fresh_var base_name =
  incr fresh_counter;
  let fresh_name = Printf.sprintf "%s_XT_%d" base_name !fresh_counter in
  fresh_name

(****************************************************************************
 * ASL Monadic Translation Structure
 *****************************************************************************)

(* State for variable renaming *)
type st = {
  id_rename: string Bindings.t; (* SAIL id -> ASL name *)
  kid_rename: string KBindings.t; (* SAIL kid -> ASL name *)
  nesting_level: int; (* Current nesting level for variable disambiguation *)
  temp_result: document option;
  temp_used: bool;
}

(* ASL translation result type *)
type ('a, 'e) result = Ok of 'a | Error of 'e

(* ASL translation monad with error messages *)
type 'a asl_m = st -> (st * PPrint.document list * 'a, string) result

(* Monadic ops *)
let return x st = Ok (st, [], x)
let retstr x st = Ok (st, [], string x)

let fail msg st = Error msg
let emit stmt st = Ok (st, [stmt], None)
let emit_all stmts st = Ok (st, stmts, None)
let read fn st = Ok (st, [], fn st)
let write fn st = Ok (fn st, [], ())
let (let@) m f st =
  match m st with
  | Error msg -> Error msg  (* Failure short-circuits with error message *)
  | Ok (st', stmts1, x) ->
      match f x st' with
      | Error msg -> Error msg
      | Ok (st'', stmts2, y) -> Ok (st'', stmts1 @ stmts2, y)
let rec traverse f = function
  | [] -> return []
  | x::xs ->
      let@ r = f x in
      let@ rs = traverse f xs in
      return (r::rs)

(* Get the ASL id for a Sail id *)
let asl_id_of_id id st =
  let asl_name = match Bindings.find_opt id st.id_rename with
    | Some name -> name
    | None -> escape_asl_id id
  in
  asl_name

(* Get the ASL id for a Sail kid *)
let asl_id_of_kid kid st =
  let asl_name = match KBindings.find_opt kid st.kid_rename with
    | Some name -> name
    | None -> escape_asl_kid kid
  in
  asl_name

(* Declare a Sail id, generating the ASL equivalent *)
let declare_id id st =
  let base_name = escape_asl_id id in
  let nested_name = if st.nesting_level = 0 then
    base_name
  else
    base_name ^ "_XN" ^ string_of_int st.nesting_level
  in
  let id_rename = Bindings.add id nested_name st.id_rename in
  Ok ({st with id_rename}, [], nested_name)

(* Declare a Sail kid, in terms of a Sail id *)
let declare_kid kid id st =
  let name = asl_id_of_id id st in
  let kid_rename = KBindings.add kid name st.kid_rename in
  Ok ({st with kid_rename}, [], name)

(* Create fresh state *)
let fresh_state = {
  id_rename = Bindings.empty;
  kid_rename = KBindings.empty;
  nesting_level = 0;
  temp_result = None;
  temp_used = false;
}

let scope fn st =
  match fn st with
  | Ok (st', stmts, r) -> Ok (st, [], (st',stmts, r))
  | Error m -> Error m

let asl_lit = function
  | L_aux (L_unit, _)       -> return (string "() UNKNOWN")
  | L_aux (L_zero, _)       -> return (string "'0'")
  | L_aux (L_one, _)        -> return (string "'1'")
  | L_aux (L_true, _)       -> return (string "TRUE")
  | L_aux (L_false, _)      -> return (string "FALSE")
  | L_aux (L_num n, _)      -> return (string (Big_int.to_string n))
  | L_aux (L_hex str, _)    -> return (string ("'" ^ hex_to_bin str ^ "'"))
  | L_aux (L_bin str, _)    -> return (string ("'" ^ str ^ "'"))
  | L_aux (L_string str, _) -> return (string ("\"" ^ str ^ "\""))
  | l -> fail ("Unknown lit: " ^ string_of_lit l)

(*******************************************************************************
 * Dependent Type Expressions
 ******************************************************************************)

let rec asl_n_constraint (NC_aux (nc, _) as n_constraint) =
  match nc with
  | NC_equal (n1, n2) ->
      let@ n1_doc = asl_typ_arg n1 in
      let@ n2_doc = asl_typ_arg n2 in
      return (n1_doc ^^ space ^^ string "==" ^^ space ^^ n2_doc)
  | NC_not_equal (n1, n2) ->
      let@ n1_doc = asl_typ_arg n1 in
      let@ n2_doc = asl_typ_arg n2 in
      return (n1_doc ^^ space ^^ string "!=" ^^ space ^^ n2_doc)
  | NC_ge (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (n1_doc ^^ space ^^ string ">=" ^^ space ^^ n2_doc)
  | NC_gt (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (n1_doc ^^ space ^^ string ">" ^^ space ^^ n2_doc)
  | NC_le (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (n1_doc ^^ space ^^ string "<=" ^^ space ^^ n2_doc)
  | NC_lt (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (n1_doc ^^ space ^^ string "<" ^^ space ^^ n2_doc)
  | NC_and (c1, c2) ->
      let@ c1_doc = asl_n_constraint c1 in
      let@ c2_doc = asl_n_constraint c2 in
      return (parens c1_doc ^^ space ^^ string "&&" ^^ space ^^ parens c2_doc)
  | NC_or (c1, c2) ->
      let@ c1_doc = asl_n_constraint c1 in
      let@ c2_doc = asl_n_constraint c2 in
      return (parens c1_doc ^^ space ^^ string "||" ^^ space ^^ parens c2_doc)
  | NC_true -> return (string "TRUE")
  | NC_false -> return (string "FALSE")

  | _ -> fail ("Unknown n_constraint: " ^ string_of_n_constraint n_constraint)

and asl_nexp (Nexp_aux (nexp, _) as n) =
  match nexp with
  | Nexp_constant n ->
      return (string (Big_int.to_string n))
  | Nexp_var kid ->
      let@ name = read (asl_id_of_kid kid) in
      retstr name
  | Nexp_exp n ->
      let@ n_doc = asl_nexp n in
      return (pow2_uop n_doc)
  | Nexp_neg n ->
      let@ n_doc = asl_nexp n in
      return (neg_uop n_doc)
  | Nexp_times (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (mul_op n1_doc n2_doc)
  | Nexp_sum (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (add_op n1_doc n2_doc)
  | Nexp_minus (n1, n2) ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (sub_op n1_doc n2_doc)
  | Nexp_if (cond, then_exp, else_exp) ->
      let@ cond_doc = asl_n_constraint cond in
      let@ then_doc = asl_nexp then_exp in
      let@ else_doc = asl_nexp else_exp in
      return (if_expr cond_doc then_doc else_doc)
  | Nexp_app (id, [n1; n2]) when string_of_id id = "div" ->
      let@ n1_doc = asl_nexp n1 in
      let@ n2_doc = asl_nexp n2 in
      return (div_op n1_doc n2_doc)
  | _ -> fail ("Unknown nexp: " ^ string_of_nexp n)

and asl_typ_arg (A_aux (arg, _) as a) =
  match arg with
  | A_nexp nexp -> asl_nexp nexp
  | _ -> fail ("Unknown typ arg: " ^ string_of_typ_arg a)

(*******************************************************************************
 * Types
 ******************************************************************************)

let type_mapping = [
  ("bool", "boolean");
  ("int", "integer");
  ("atom", "integer");
  ("atom_bool", "boolean");
  ("unit", "()");
  ("range", "integer");
]

let typ_is_unit (Typ_aux (t, annot)) =
  match t with
  | Typ_id tid when string_of_id tid = "unit" -> true
  | _ -> false

let rec asl_typ ?(id) env (Typ_aux (t, annot) as typ) =
  match t with
  | Typ_id tid when List.mem_assoc (string_of_id tid) type_mapping ->
      return (string (List.assoc (string_of_id tid) type_mapping))
  | Typ_id tid ->
      return (string (string_of_id tid))
  | Typ_exist (_, _, typ) ->
      asl_typ env typ
  | Typ_tuple typs  ->
      let@ typs = traverse (asl_typ env) typs in
      return (parens (separate (comma ^^ space) typs))

  | Typ_app (tid, [arg]) when string_of_id tid = "bitvector" || string_of_id tid = "bits" ->
      let@ arg = asl_typ_arg arg in
      return (string "bits" ^^ parens arg)
  | Typ_app (tid, [n_arg; A_aux (A_typ elem_typ, _)]) when string_of_id tid = "vector" ->
      (match resolve_bitvector_width env elem_typ with
      | Some width_nexp ->
          let@ n_doc = asl_typ_arg n_arg in
          let@ m_doc = asl_nexp width_nexp in
          return (string "bits" ^^ parens (mul_op n_doc m_doc))
      | None -> fail ("Unsupported vector element type: " ^ string_of_typ elem_typ))

  | Typ_app (tid, args) when string_of_id tid = "range" ->
      return (string "integer")
  | Typ_app (tid, [arg]) when string_of_id tid = "atom_bool" ->
      return (string "boolean")
  | Typ_app (tid, [arg]) when string_of_id tid = "atom" ->
      (match id, arg with
      | Some bid, A_aux (A_nexp (Nexp_aux (Nexp_var kid, _)), _) ->
          let@ _ = declare_kid kid bid in
          return (string "integer")
      | _ -> return (string "integer"))

  | _ -> fail ("Unknown typ: " ^ string_of_typ typ)

(*******************************************************************************
 * Variable Declerations
 ******************************************************************************)

(* Prepare a temporary *)
let asl_prep_temp env typ =
  let@ typ_doc = asl_typ env typ in
  let fresh_name = string (fresh_var "temp") in
  let decl_stmt = typ_doc ^^ space ^^ fresh_name ^^ semi in
  let@ () = write (fun st -> {st with temp_result = Some (fresh_name); temp_used = false}) in
  return (decl_stmt, fresh_name)

(* Access the prepared temporary, if one exists *)
let asl_get_temp =
  let@ () = write (fun st -> {st with temp_used = st.temp_result <> None}) in
  read (fun st -> st.temp_result)

let asl_peek_temp =
  read (fun st -> st.temp_result <> None)

(* Generate a temporary to hold a result *)
let asl_temp_decl env typ =
  let@ typ_doc = asl_typ env typ in
  let fresh_name = fresh_var "temp" in
  let decl_stmt = typ_doc ^^ space ^^ string fresh_name ^^ semi in
  let@ _ = emit decl_stmt in
  return (string fresh_name)

(*******************************************************************************
 * Statement Helpers
 ******************************************************************************)

(* Construct a constant decl, generally from a let expression *)
let rec asl_const_decl (P_aux(p,annot) as pat) exp_doc =
  let env = env_of_annot annot in
  match p with
  | P_id id ->
      let typ = typ_of_annot annot in
      let@ var_doc = declare_id id in
      let@ typ_doc = asl_typ ~id env typ in
      emit (const_stmt typ_doc (string var_doc) exp_doc)
  | P_var (P_aux (P_id id, _), TP_aux (TP_var kid, _)) ->
      let typ = typ_of_annot annot in
      let@ var_doc = declare_id id in
      let@ typ_doc = asl_typ ~id env typ in
      let@ _ = declare_kid kid id in
      emit (const_stmt typ_doc (string var_doc) exp_doc)
  | P_typ (_, p) ->
      asl_const_decl p exp_doc
  | _ ->
      let rec build_assign (P_aux(p,annot)) = match p with
      | P_id id ->
          let typ = typ_of_annot annot in
          let@ var_doc = declare_id id in
          let@ typ_doc = asl_typ ~id env typ in
          let@ _ = emit (var_decl_stmt typ_doc (string var_doc)) in
          retstr var_doc
      | P_typ (_, p) -> build_assign p
      | P_lit (L_aux (L_unit, _)) -> return wild_doc
      | P_wild -> return wild_doc
      | P_var (P_aux (P_id id, _), TP_aux (TP_var kid, _)) ->
          let typ = typ_of_annot annot in
          let@ var_doc = declare_id id in
          let@ typ_doc = asl_typ ~id env typ in
          let@ _ = emit (var_decl_stmt typ_doc (string var_doc)) in
          retstr var_doc
      | P_tuple pats ->
          let@ res = traverse build_assign pats in
          return (parens (separate (comma ^^ space) res))
      | _ ->
          fail ("Complex const decl: " ^ string_of_pat pat ^ " = " ^ to_string exp_doc)
      in
      let@ var_doc = build_assign pat in
      emit (assign_stmt var_doc exp_doc)

(* Construct a variable decl, generally from a var expression *)
let asl_var_decl (LE_aux (l, annot) as lexp) exp_doc =
  let env = env_of_annot annot in
  match l with
  | LE_typ (_, id)
  | LE_id id ->
      let typ = typ_of_annot annot in
      let@ var_str = declare_id id in
      let@ typ_doc = asl_typ ~id env typ in
      emit (var_stmt typ_doc (string var_str) exp_doc)
  | _ ->
      fail ("Complex var decl: " ^ string_of_lexp lexp ^ " = " ^ to_string exp_doc)

(* Construct a variable assignment *)
let asl_var_assign lexp exp_doc =
  let rec asl_lexp (LE_aux (l, _) as lexp) =
    match l with
    | LE_id id
    | LE_typ (_, id) ->
        let@ var_str = read (asl_id_of_id id) in retstr var_str
    | LE_field (lexp, id) ->
        let@ lexp_doc = asl_lexp lexp in
        return (lexp_doc ^^ dot ^^ id_doc id)
    | _ -> fail ("Complex var assign: " ^ string_of_lexp lexp ^ " = " ^ to_string exp_doc)
  in
  let@ lexp_doc = asl_lexp lexp in
  emit (assign_stmt lexp_doc exp_doc)

(* Construct a return/assert statements *)
let asl_return arg = emit (return_stmt arg)
let asl_assert arg = emit (assert_stmt arg)
let asl_ignore arg = emit (assign_stmt wild_doc arg)
let asl_unit arg = emit (arg ^^ semi)

(* Construct an pattern match case *)
let rec asl_pat (P_aux (p, annot) as pat) =
  let uannot = untyped_annot (snd annot) in
  match p with
  | P_wild when get_attribute "int_wildcard" uannot <> None ->
      (match get_attribute "int_wildcard" uannot with
      | Some (_, Some (Parse_ast.Attribute_data.AD_aux(AD_num n,_))) -> 
          return (string (Big_int.to_string n))
      | _ -> failwith "")
  | P_wild
  | P_lit (L_aux (L_unit, _)) ->
      return wild_doc
  | P_lit lit ->
      asl_lit lit
  | P_id id   ->
      return (string (escape_asl_id id))
  | P_typ (_, p) ->
      asl_pat p
  | P_tuple pats ->
      let@ res = traverse asl_pat pats in
      let vals = (separate (comma ^^ space) res) in
      return (parens vals)
  | _ ->
      fail ("Complex pattern match not supported: " ^ string_of_pat pat)

(*******************************************************************************
 * Main translation body
 ******************************************************************************)

let some x =
  return (Some x)

let retval annot v =
  match typ_of_annot annot with
  | t when typ_is_unit t ->
      return None
  | _ -> return (Some v)

let rec collect_if (E_aux (e, _) as exp) =
  match e with
  | E_if (cond, tbody, fbody) ->
      let (rest,default) = collect_if fbody in
      (cond,tbody)::rest,default
  | _ -> ([],exp)

let assign_stmt_opt var_opt exp =
  match var_opt with
  | Some var when var = exp -> []
  | Some var -> [var ^^ space ^^ equals ^^ space ^^ exp ^^ semi]
  | None -> [exp ^^ semi]

(* Force an expression construct from a Sail expression *)
let rec asl_expr (E_aux(_,annot) as e) =
  let typ = typ_of_annot annot in
  let env = env_of_annot annot in
  let@ (st',eff,(decl,res)) = scope (
    let@ (decl,_) = asl_prep_temp env typ in
    let@ res = asl_exp e in
    return (decl,res)
  ) in
  let@ _ = if st'.temp_used then emit_all (decl::eff) else emit_all eff in
  return (match res with Some v -> v | _ -> unit_lit_doc)

(* Force a statement construct from a Sail expression *)
and asl_body ret (E_aux(_,annot) as e) =
  let typ = typ_of_annot annot in
  let env = env_of_annot annot in
  let@ (st',eff,(decl,res)) = scope (
    let@ (decl,_) = asl_prep_temp env typ in
    let@ res = asl_exp e in
    return (decl,res)
  ) in
  let@ _ = if st'.temp_used then emit_all (decl::eff) else emit_all eff in
  match res with
  | None -> return ()
  | Some v ->
      let@ v = ret v in
      match v with
      | Some _ -> fail ("Unexpected return value from body: " ^ string_of_exp e)
      | None -> return ()

and asl_stmt e =
  let@ res = (asl_exp e) in
  match res with
  | None -> return ()
  | Some v -> fail ("Unexpected return value from stmt: " ^ string_of_exp e)

(* Main translation function *)
and asl_exp (E_aux (e, annot) as exp) =
  let env = env_of_annot annot in
  match e with
  (* Literals and variable access *)
  | E_lit (L_aux (L_undef, _))->
      let@ typ_doc = asl_typ env (typ_of exp) in
      retval annot (unknown_exp typ_doc)
  | E_lit lit ->
      let@ lit_doc = asl_lit lit in
      retval annot (lit_doc)
  | E_id id ->
      let@ var_str = read (asl_id_of_id id) in
      retval annot (string var_str)

  (* Special cased function application *)
  | E_app (id, [arg]) when string_of_id id = "bitvector_length" ->
      let arg_typ = typ_of arg in
      (match resolve_bitvector_width env arg_typ with
      | Some nexp ->
          let@ nexp_doc = asl_nexp nexp in
          some nexp_doc
      | None -> fail ("bitvector_length over unsupported type: " ^ string_of_typ arg_typ))
  | E_app (id, args) when List.mem_assoc (string_of_id id) vec_ops ->
      let varg = List.nth args (List.assoc (string_of_id id) vec_ops) in
      let@ args = traverse asl_expr args in
      let vector_typ = typ_of varg in
      (match resolve_vector_size env vector_typ with
      | Some (elems,elemw) ->
          let@ elems_doc = asl_nexp elems in
          let@ elemw_doc = asl_nexp elemw in
          some (call_doc (escape_asl_id id) (args@[elems_doc;elemw_doc]))
      | None -> fail ("vector operation over unsupported type: " ^ string_of_typ vector_typ))
  | E_app (id, _) when string_of_id id = "internal_error" ->
      asl_assert false_doc

  (* Standard expression *)
  | E_app (id, args) ->
      let@ exprs = traverse asl_expr args in
      let call = call_doc (escape_asl_id id) exprs in
      if typ_is_unit (typ_of_annot annot) then
        emit (call ^^ semi)
      else
        some call
  | E_tuple exprs ->
      let@ exprs = traverse asl_expr exprs in
      some (tuple_doc exprs)
  | E_field (exp, id) ->
      let@ exp_doc = asl_expr exp in
      some (exp_doc ^^ dot ^^ id_doc id)
  | E_vector exprs ->
      let@ exprs = traverse asl_expr (List.rev exprs) in
      some (separate colon exprs)
  | E_struct (SN_id id, fexps) ->
      let helper_name = "asl_make_" ^ escape_asl_id id in
      let@ field_args = traverse (fun (FE_aux (FE_fexp (_, exp), _)) -> asl_expr exp) fexps in
      some (call_doc helper_name field_args)

  (* Pass-through *)
  | E_typ (_, exp) -> asl_exp exp
  | E_block [] -> return None
  | E_block exprs ->
      let@ _ = traverse (asl_body asl_unit) (Util.butlast exprs) in
      asl_exp (Util.last exprs)

  (* Variable management *)
  | E_let (LB_aux (LB_val (P_aux(P_tuple pats,_), E_aux(E_tuple exps,_)), _), body) ->
      let lets = List.combine pats exps in
      let@ _ = traverse (fun (pat,exp) ->
        let@ exp_doc = asl_expr exp in
        asl_const_decl pat exp_doc) lets in
      asl_exp body
  | E_let (LB_aux (LB_val (pat, exp), _), body) ->
      let@ exp_doc = asl_expr exp in
      let@ _ = asl_const_decl pat exp_doc in
      asl_exp body
  | E_var (lexp, exp, body) ->
      let@ exp_doc = asl_expr exp in
      let@ _ = asl_var_decl lexp exp_doc in
      asl_exp body
  | E_assign (lexp, exp) ->
      let@ exp = asl_expr exp in
      asl_var_assign lexp exp

  (* Standard statements *)
  | E_assert (exp, _) ->
      let@ exp = asl_expr exp in
      asl_assert exp
  | E_throw (E_aux (E_app (id, _), _)) ->
      asl_assert false_doc
  | E_return exp ->
      let@ exp = asl_expr exp in
      asl_return exp
  | E_exit exp ->
      let@ exp = asl_expr exp in
      emit (call_doc "exit" [exp] ^^ semi)

  (* Nested statements *)
  | E_if (cond, tcase, fcase) ->
      let@ cond = asl_expr cond in
      let@ (_,tbody,tres) = scope (asl_exp tcase) in
      let@ (_,fbody,fres) = scope (asl_exp fcase) in
      (match tbody, tres, fbody, fres with
      | [], Some t, [], Some f -> retval annot (if_expr cond t f)
      | _, None, [], None -> emit (if_stmt cond tbody)
      | _, None, _, None ->
          emit (if_else_stmt cond tbody fbody)
      | _ ->
          let@ temp = asl_get_temp in
          let tbody = match tres with Some t -> tbody@(assign_stmt_opt temp t) | _ -> tbody in
          let fbody = match fres with Some t -> fbody@(assign_stmt_opt temp t) | _ -> fbody in
          let@ _ = emit (if_else_stmt cond tbody fbody) in
          return temp)
  | E_match (exp, arms) ->
      let@ exp_doc = asl_expr exp in
      let@ arms = traverse (fun arm ->
        let (pat, guard_opt, body, arm_annot) = destruct_pexp arm in
        let@ pat_doc = asl_pat pat in
        let@ guard_doc = match guard_opt with
          | None -> return empty
          | Some guard_exp ->
              let@ guard = asl_expr guard_exp in
              return (space ^^ string "&&" ^^ space ^^ guard)
        in
        let@ (_,tbody,res) = scope (asl_exp body) in
        return (string "when" ^^ space ^^ pat_doc ^^ guard_doc,tbody,res)
      ) arms in
      if List.for_all (fun (_,_,res) -> res = None) arms then
        let arm_docs = List.map (fun (cond,body,res) -> (cond ^^ block body)) arms in
        emit (string "case" ^^ space ^^ exp_doc ^^ space ^^ string "of" ^^ block arm_docs)
      else
        let@ temp = asl_get_temp in
        let arm_docs = List.map (fun (cond,body,res) ->
          match res with
          | None -> (cond ^^ block body)
          | Some v -> (cond ^^ block (body@(assign_stmt_opt temp v)))) arms in
        let@ _ = emit (string "case" ^^ space ^^ exp_doc ^^ space ^^ string "of" ^^ block arm_docs)  in
        return temp
  | E_for (id, from_exp, to_exp, E_aux(E_lit (L_aux (L_num i, _)), _), order, body)
        when Big_int.equal i (Big_int.of_int 1) ->
      let@ from_doc = asl_expr from_exp in
      let@ to_doc = asl_expr to_exp in
      let@ (_,loop_body,var_doc) = scope (
        let@ var_str = declare_id id in
        let@ () = asl_body asl_unit body in
        retstr var_str
      ) in
      let loop_direction = match order with
        | Ord_aux (Ord_inc, _) -> string "to"
        | Ord_aux (Ord_dec, _) -> string "downto"
      in
      emit (for_stmt var_doc from_doc to_doc loop_direction loop_body)
  | E_for (id, from_exp, to_exp, stride_exp, order, body) ->
      (* TODO: Implicit assumption that from_exp and to_exp are multiples of stride_exp *)
      let@ from_doc = asl_expr from_exp in
      let@ to_doc = asl_expr to_exp in
      let@ stride_doc = asl_expr stride_exp in
      let i = Typ_aux (Typ_id (mk_id "int"), fst annot) in
      let@ new_var_doc = asl_temp_decl env i in
      let@ (_,loop_body,var_doc) = scope (
        let@ var_str = declare_id id in
        let@ _ = emit (const_stmt (string "integer") (string var_str) (mul_op new_var_doc stride_doc)) in
        let@ () = asl_body asl_unit body in
        retstr var_str
      ) in
      let loop_direction = match order with
        | Ord_aux (Ord_inc, _) -> string "to"
        | Ord_aux (Ord_dec, _) -> string "downto"
      in
      emit (for_stmt new_var_doc (div_op from_doc stride_doc) (div_op to_doc stride_doc)
                loop_direction loop_body)
  | E_loop (Until, _, cond, body) ->
      let@ (_,loop_body,cond_doc) = scope (
        let@ () = asl_body asl_unit body in
        asl_expr cond
      ) in
      emit (repeat_stmt loop_body cond_doc)

  | _ -> fail ("Unsupported exp: " ^ string_of_exp exp)

(*******************************************************************************
 * Function Pretty Printing
 ******************************************************************************)

let rec asl_param (P_aux (p, annot) as pat) =
  let env = env_of_annot annot in
  match p with
  | P_lit (L_aux (L_unit, _))
  | P_wild ->
      let@ typ_doc = asl_typ env (typ_of_annot annot) in
      return (typ_doc, string "wild")
  | P_id id ->
      let@ id_str = declare_id id in
      let@ typ_doc = asl_typ ~id env (typ_of_annot annot) in
      return (typ_doc, string id_str)
  | P_typ (_, pat) ->
      asl_param pat
  | _ ->
      fail ("Complex parameter pattern not supported: " ^ string_of_pat pat)

let asl_params_once (P_aux (p, annot) as pat) =
  let@ args = (match p with
  | P_lit (L_aux (L_unit, _)) -> return []
  | P_tuple pats -> traverse asl_param pats
  | P_typ _ when typ_is_unit (typ_of_annot annot) ->
      return []
  | P_id _ when typ_is_unit (typ_of_annot annot) ->
      return []
  | P_wild ->
      let (l,tannot) = annot in
      (match typ_of_annot annot with
      | Typ_aux (Typ_tuple typs, _) ->
          let pats = List.mapi (fun i typ ->
            let id = mk_id ("wild" ^ string_of_int i) in
            P_aux (P_id id, (l, replace_typ typ tannot))
          ) typs in
          traverse asl_param  pats
      | t when typ_is_unit t ->
          return []
      | _ ->
          let@ res = asl_param pat in
          return [res])
  | _ ->
      let@ res = asl_param pat in
      return [res]
  ) in
  let res = List.map (fun (typ,doc) -> typ ^^ space ^^ doc) args in
  return (separate (comma ^^ space) res)

(* Run twice... *)
let asl_params pat =
  let@ _ = asl_params_once pat in
  asl_params_once pat

let asl_funcl (FCL_aux (FCL_funcl (id, pexp), annot) as f) =
  let fname = escape_asl_id id in
  let (pat, guard, body, _) = destruct_pexp pexp in
  let rtyp = Asl_context.rty_of_funcl f in
  let env = env_of_tannot (snd annot) in
  if (guard <> None) then fail ("fundef with guard: " ^ fname) else
    let@ (_,body_stmts, (params_doc, rtyp_doc)) = scope (
      let@ params = asl_params pat in
      let@ rtyp_doc = asl_typ env rtyp in
      let@ () = asl_body asl_return body in
      return (params, rtyp_doc)
    ) in
    return (rtyp_doc ^^ space ^^ string fname ^^ parens params_doc ^^ block body_stmts)

let unwrap_pure fn =
  match fn fresh_state with
  | Error msg -> Error msg
  | Ok (_, [], i) -> Ok i
  | _ -> Error ("Unexpected effects")

let unwrap_pure_opt fn =
  match fn fresh_state with
  | Error msg -> Error msg
  | Ok (_, [], Some i) -> Ok i
  | _ -> Error ("Unexpected effects")

let unwrap_unit fn =
  match fn fresh_state with
  | Error msg -> Error msg
  | Ok (_, l, ()) -> Ok (separate hardline l)

let unwrap_stmt fn =
  match fn fresh_state with
  | Error msg -> Error msg
  | Ok (_, [l], None) -> Ok (l)
  | _ -> Error ("Unexpected effects")

(****************************************************************************
 * Entrypoints
 ******************************************************************************)

let pp_exp e = unwrap_pure_opt (asl_exp e)

let pp_stmts e = unwrap_unit (asl_body asl_return e)

(* TODO: This isn't quite right: returns can't take unit and implicit results should terminate *)
let pp_instruction_stmts e = unwrap_unit (asl_body asl_ignore e)

let pp_fundef (FD_aux (FD_function (_, _, funcls), _)) =
  fresh_counter := 0;
  match funcls with
  | [funcl] -> unwrap_pure (asl_funcl funcl)
  | _ -> Error ("Function with many clauses")

(* Print just the signature of a function (for external functions) *)
let pp_fundef_signature (FD_aux (FD_function (_, _, funcls), _)) =
  match funcls with
  | [FCL_aux (FCL_funcl (id, pexp), annot)] ->
      let fname = string_of_id id in
      let (pat, guard, _, _) = destruct_pexp pexp in
      if guard <> None then Error ("fundef with guard: " ^ fname) else
        let rtyp = Asl_context.rty_of_funcl (FCL_aux (FCL_funcl (id, pexp), annot)) in
        let env = env_of_tannot (snd annot) in
        unwrap_pure @@
          let@ params_doc = asl_params pat in
          let@ rtyp_doc = asl_typ env rtyp in
          return (rtyp_doc ^^ space ^^ string fname ^^ parens params_doc)
  | _ -> Error ("Function with many clauses")

let pp_letdef (LB_aux (LB_val (pat, exp), _)) = unwrap_stmt @@
  match pat with
  | P_aux (P_lit (L_aux (L_unit, _)), _) ->
      emit empty
  | _ ->
      let@ exp_doc = asl_expr exp in
      asl_const_decl pat exp_doc

let pp_regdef (DEC_aux (DEC_reg (typ, id, opt_exp), annot)) = unwrap_pure @@
  let env = env_of_tannot (snd annot) in
  let@ typ = asl_typ env typ in
  return (typ ^^ space ^^ string (escape_asl_id id) ^^ semi)

let try_env_of_tannot tannot =
  try
    env_of_tannot tannot
  with
    _ -> Env.empty

let pp_typedef (TD_aux (td_aux, annot)) = unwrap_pure @@
  let env = try_env_of_tannot (snd annot) in
  match td_aux with
  | TD_enum(id, ids, _) ->
      let enum = List.map (fun id -> string (escape_asl_id id)) ids in
      let opts = nest 4 (hardline ^^ separate (hardline ^^ comma ^^ space) enum) in
      let head = string "enumeration" ^^ space ^^ string (escape_asl_id id) in
      return (head ^^ space ^^ lbrace ^^ opts ^^ hardline ^^ rbrace ^^ semi)
  | TD_variant(id, _, constructors, false) ->
      (* Check if this is a simple enum (all constructors take unit) *)
      let is_simple_enum = List.for_all (function
        | Tu_aux (Tu_ty_id (Typ_aux (Typ_id unit_id, _), _), _) ->
            string_of_id unit_id = "unit"
        | _ -> false
      ) constructors in
      if is_simple_enum then
        (* Generate ASL enumeration for transformed union-to-enum types *)
        let constructor_names = List.map (function
          | Tu_aux (Tu_ty_id (_, ctor_id), _) -> string (escape_asl_id ctor_id)
        ) constructors in
        let opts = nest 4 (hardline ^^ separate (hardline ^^ comma ^^ space) constructor_names) in
        let head = string "enumeration" ^^ space ^^ string (escape_asl_id id) in
        return (head ^^ space ^^ lbrace ^^ opts ^^ hardline ^^ rbrace ^^ semi)
      else
        (* Complex union types are not supported in ASL *)
        fail ("Complex union types not supported in ASL: " ^ string_of_id id)
  | TD_record(id, _, fields, _) ->
      let@ field_docs = traverse (fun (typ, field_id) ->
        let@ typ_doc = asl_typ env typ in
        return (typ_doc ^^ space ^^ string (escape_asl_id field_id))) fields in
      let record_name = string (escape_asl_id id) in
      let type_head = string "type" ^^ space ^^ record_name ^^ space ^^ string "is" in
      let type_def = type_head ^^ space ^^ parens (separate (comma ^^ hardline) field_docs) in

      (* Generate helper function asl_make_RECORD_TYPE *)
      let helper_name = "asl_make_" ^ (escape_asl_id id) in
      let@ param_docs = traverse (fun (typ, field_id) ->
        let@ typ_doc = asl_typ env typ in
        return (typ_doc ^^ space ^^ string (escape_asl_id field_id))) fields in
      let params = separate (comma ^^ space) param_docs in

      let@ field_assignments = traverse (fun (typ, field_id) ->
        let field_name = escape_asl_id field_id in
        return (string "temp" ^^ dot ^^ string field_name ^^ space ^^ equals ^^ space ^^ string field_name ^^ semi)
      ) fields in

      let helper_body = nest 4 (hardline ^^
        record_name ^^ space ^^ string "temp" ^^ semi ^^ hardline ^^
        separate hardline field_assignments ^^ hardline ^^
        string "return temp" ^^ semi) in

      let helper_func = record_name ^^ space ^^ string helper_name ^^ parens params ^^ helper_body in

      return (type_def ^^ hardline ^^ hardline ^^ helper_func)
  | TD_abbrev (id, typquant, A_aux (A_typ typ, _)) ->
      let@ typ_doc = asl_typ env typ in
      let head = string "type" ^^ space ^^ string (escape_asl_id id) in
      return (head ^^ space ^^ equals ^^ space ^^ typ_doc ^^ semi)
  | TD_abbrev (id, typquant, A_aux (A_nexp nexp, _)) ->
      let@ exp = asl_nexp nexp in
      let id = string (string_of_id id) in
      return (string "constant" ^^ space ^^ string "integer" ^^ space ^^ id ^^ space ^^
        equals ^^ space ^^ exp ^^ semi)
  | TD_abbrev (id, typquant, _) ->
      (* TODO: This isn't quite right *)
      let head = string "type" ^^ space ^^ string (escape_asl_id id) in
      return (head ^^ space ^^ equals ^^ space ^^ string "integer" ^^ semi)
  | _ ->
      fail ("Unsupported type definition")
