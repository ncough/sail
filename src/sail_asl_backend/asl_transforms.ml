open Libsail

open Ast
open Ast_defs
open Ast_util
open Rewriter
open Type_check

(****************************************************************************
 * AST Type Transformation Utilities
 *****************************************************************************)

(* Transform a single type recursively *)
let rec transform_ast_type transform_fn typ = match typ with
  | Typ_aux (Typ_tuple typs, annot) ->
      let transformed_typs = List.map (transform_ast_type transform_fn) typs in
      let new_typ = Typ_aux (Typ_tuple transformed_typs, annot) in
      transform_fn new_typ
  | Typ_aux (Typ_app (id, typ_args), annot) ->
      let transformed_args = List.map (function
        | A_aux (A_typ t, a) -> A_aux (A_typ (transform_ast_type transform_fn t), a)
        | other -> other
      ) typ_args in
      let new_typ = Typ_aux (Typ_app (id, transformed_args), annot) in
      transform_fn new_typ
  | Typ_aux (Typ_fn (arg_typs, ret_typ), annot) ->
      Typ_aux (Typ_fn (List.map (transform_ast_type transform_fn) arg_typs, transform_ast_type transform_fn ret_typ), annot)
  | Typ_aux (Typ_bidir (left_typ, right_typ), annot) ->
      Typ_aux (Typ_bidir (transform_ast_type transform_fn left_typ, transform_ast_type transform_fn right_typ), annot)
  | Typ_aux (Typ_exist (kids, constraint_, typ), annot) ->
      Typ_aux (Typ_exist (kids, constraint_, transform_ast_type transform_fn typ), annot)
  | _ -> transform_fn typ

let rewrite_exp_pat exp_alg pat_alg =
  let rewriter = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp { exp_alg with pat_alg } exp);
    rewrite_pat = (fun _rewriters pat -> fold_pat pat_alg pat);
  } in
  rewrite_ast_base rewriter

(* Transform all types in a complete AST using expression and pattern algebras *)
let transform_ast_types transform_fn ast =
  let exp_alg = {
    id_exp_alg with
    e_typ = (fun (typ, exp) -> E_typ (transform_ast_type transform_fn typ, exp));
    le_typ = (fun (typ, id) -> LE_typ (transform_ast_type transform_fn typ, id));
  } in

  let pat_alg = {
    id_pat_alg with
    p_typ = (fun (typ, pat) -> P_typ (transform_ast_type transform_fn typ, pat));
  } in

  let ast = rewrite_exp_pat exp_alg pat_alg ast in

  let rewrite_def def =
    match def with
    | DEF_aux (DEF_fundef (FD_aux (FD_function (rec_opt, tannot_opt, funcls), fd_annot)), def_annot) ->
        let transform_tannot_opt = function
          | Typ_annot_opt_aux (Typ_annot_opt_none, annot) as tannot -> tannot
          | Typ_annot_opt_aux (Typ_annot_opt_some (typq, typ), annot) ->
              Typ_annot_opt_aux (Typ_annot_opt_some (typq, transform_ast_type transform_fn typ), annot)
        in
        let transformed_tannot = transform_tannot_opt tannot_opt in
        DEF_aux (DEF_fundef (FD_aux (FD_function (rec_opt, transformed_tannot, funcls), fd_annot)), def_annot)
    | DEF_aux (DEF_val (VS_aux (VS_val_spec (typschm, id, externs), vs_annot)), def_annot) ->
        let transform_typschm = function
          | TypSchm_aux (TypSchm_ts (typq, typ), annot) ->
              TypSchm_aux (TypSchm_ts (typq, transform_ast_type transform_fn typ), annot)
        in
        let transformed_typschm = transform_typschm typschm in
        DEF_aux (DEF_val (VS_aux (VS_val_spec (transformed_typschm, id, externs), vs_annot)), def_annot)
    | DEF_aux (DEF_type (TD_aux (TD_record (record_id, typquant, fields, is_impl), td_annot)), def_annot) ->
        let transformed_fields = List.map (fun (field_typ, field_id) ->
          (transform_ast_type transform_fn field_typ, field_id)
        ) fields in
        DEF_aux (DEF_type (TD_aux (TD_record (record_id, typquant, transformed_fields, is_impl), td_annot)), def_annot)
    | DEF_aux (DEF_type (TD_aux (TD_abbrev (abbrev_id, typquant, typ_arg), td_annot)), def_annot) ->
        let transform_typ_arg = function
          | A_aux (A_typ typ, annot) -> A_aux (A_typ (transform_ast_type transform_fn typ), annot)
          | other -> other
        in
        let transformed_typ_arg = transform_typ_arg typ_arg in
        DEF_aux (DEF_type (TD_aux (TD_abbrev (abbrev_id, typquant, transformed_typ_arg), td_annot)), def_annot)
    | DEF_aux (DEF_register (DEC_aux (DEC_reg (reg_typ, reg_id, reg_exp_opt), dec_annot)), def_annot) ->
        let transformed_typ = transform_ast_type transform_fn reg_typ in
        DEF_aux (DEF_register (DEC_aux (DEC_reg (transformed_typ, reg_id, reg_exp_opt), dec_annot)), def_annot)
    | DEF_aux (DEF_type (TD_aux (TD_variant (variant_id, typquant, type_unions, is_exhaustive), td_annot)), def_annot) ->
        let transform_type_union (Tu_aux (Tu_ty_id (typ, id), annot)) =
          let transformed_typ = transform_ast_type transform_fn typ in
          Tu_aux (Tu_ty_id (transformed_typ, id), annot)
        in
        let transformed_unions = List.map transform_type_union type_unions in
        DEF_aux (DEF_type (TD_aux (TD_variant (variant_id, typquant, transformed_unions, is_exhaustive), td_annot)), def_annot)
    | DEF_aux (DEF_type (TD_aux (TD_bitfield (bf_id, bf_typ, fields), td_annot)), def_annot) ->
        let transformed_typ = transform_ast_type transform_fn bf_typ in
        DEF_aux (DEF_type (TD_aux (TD_bitfield (bf_id, transformed_typ, fields), td_annot)), def_annot)
    | other -> other
  in
  let defs = List.map rewrite_def ast.defs in
  { ast with defs }

let transform_annot fn (l,tannot) =
  let tannot = replace_typ (fn (typ_of_tannot tannot)) tannot in
  (l, tannot)

(* Transform all types in a complete AST using expression and pattern algebras *)
let transform_instruction_info_types transform_fn info =
  let exp_alg = {
    id_exp_alg with
    e_typ = (fun (typ, exp) -> E_typ (transform_ast_type transform_fn typ, exp));
    le_typ = (fun (typ, id) -> LE_typ (transform_ast_type transform_fn typ, id));
    e_aux = (fun (exp, annot) ->
      E_aux (exp, transform_annot transform_fn annot));
  } in

  let pat_alg = {
    id_pat_alg with
    p_typ = (fun (typ, pat) -> P_typ (transform_ast_type transform_fn typ, pat));
    p_aux = (fun (pat, annot) ->
      P_aux (pat, transform_annot transform_fn annot));
  } in

  let open Asl_extraction in
  List.map (fun info ->
    let guard = Option.map (fold_exp { exp_alg with pat_alg }) info.guard in
    let body = fold_exp { exp_alg with pat_alg } info.body in
    {info with guard ; body}) info

(****************************************************************************
 * Trivial Match Elimination Transform
 *****************************************************************************)

(* Check if a pattern is irrefutable (will always match) *)
let rec is_irrefutable_pattern (P_aux (p, ann)) =
  match p with
  | P_lit (L_aux (L_unit, _)) | P_wild -> true
  | P_as (p1, _) | P_typ (_, p1) -> is_irrefutable_pattern p1
  | P_id id -> begin
      try
        match Env.lookup_id id (env_of_annot ann) with
        | Local _ | Unbound _ -> true
        | Register _ -> false
        | Enum enum -> (
            match enum with
            | Typ_aux (Typ_id enum_id, _) -> List.length (Env.get_enum enum_id (env_of_annot ann)) <= 1
            | _ -> false
          )
      with _ -> false
    end
  | P_tuple ps -> List.for_all is_irrefutable_pattern ps
  | P_struct (_, fpats, _) -> List.for_all is_irrefutable_pattern (List.map snd fpats)
  | _ -> false

(* Transform trivial matches into let expressions *)
let eliminate_trivial_matches ast =
  let exp_alg = {
    id_exp_alg with
    e_case = (fun (match_exp, arms) ->
      match arms with
      | [(Pat_aux (Pat_exp (pat, body), annot))] ->
          E_let (LB_aux (LB_val (pat, match_exp), annot), body)
      | (Pat_aux (Pat_exp (pat, body), annot))::_ when is_irrefutable_pattern pat ->
          E_let (LB_aux (LB_val (pat, match_exp), annot), body)
      | _ -> E_match (match_exp, arms));
  } in
  let trivial_match_rewriters = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp exp_alg exp);
  } in
  rewrite_ast_base trivial_match_rewriters ast

(****************************************************************************
 * AST Pattern Matching Utilities
 *****************************************************************************)

(* Match template let var = opcode in match (match var arms) {Some(result) => result} *)
let match_decode_template = function
  | E_aux (E_let (LB_aux (LB_val (P_aux (P_id var, _), (E_aux (E_id opcode_var, _) as opcode)), _),
      E_aux (E_match (E_aux (E_match (E_aux (E_id var', _), arms), match_annot),
        [Pat_aux (Pat_exp (P_aux (P_app (some_id, [P_aux (P_id result, _)]), _),
          E_aux (E_id result', _)), pat_annot)]), _)), _)
      when string_of_id some_id = "Some"  && Id.compare var var' = 0 && Id.compare result result' = 0 ->
      Some (opcode, arms, match_annot, pat_annot)
  | _ -> None

(****************************************************************************
 * Arm Processing and Transformation
 *****************************************************************************)

type 'a arm =
  Reject |
  Ignore |
  Accept of ('a pat * 'a exp option * 'a exp * (l * 'a))

let join x y =
  match x, y with
  | Ignore, x
  | x, Ignore -> x
  | _ -> Reject

(* Extract substitution mappings from pattern and match expression *)
let rec extract_substitutions pat match_exp =
  match pat, match_exp with
  | P_aux (P_id id, _), exp -> [(id, exp)]
  | P_aux (P_tuple pats, _), E_aux (E_tuple exps, _) when List.length pats = List.length exps ->
      List.flatten (List.map2 extract_substitutions pats exps)
  | P_aux (P_tuple pats, _), exp ->
      (* Skip complex cases where match_exp is not a tuple *)
      []
  | _ -> []

(* Substitute variables in expression using substitution list *)
let substitute_in_exp substitutions exp =
  let subst_map = List.fold_left (fun acc (id, exp) ->
    Bindings.add id exp acc
  ) Bindings.empty substitutions in

  let exp_alg = {
    id_exp_alg with
    e_id = (fun id ->
      match Bindings.find_opt id subst_map with
      | Some replacement -> unaux_exp replacement
      | None -> E_id id
    );
  } in

  fold_exp exp_alg exp

let seq_guard pat' match_var x y =
  match x, y with
  | Some (E_aux (_, a) as x), Some y ->
      (* Extract substitutions and apply them to y *)
      let substitutions = extract_substitutions pat' match_var in
      let y_substituted = substitute_in_exp substitutions y in
      Some (E_aux (E_app (mk_id "and_bool", [x; y_substituted]), a))
  | None, _ -> y
  | _, None -> x

let mk_let pat exp cont a =
  E_aux (E_let (LB_aux (LB_val (pat, exp), a), cont), a)

(* Process a single arm from the inner match *)
let rec process_arm arm =
  let (pat, guard_opt, body, _) = destruct_pexp arm in
  match body with
  | E_aux (E_id (id), _) when string_of_id id = "None" ->
      Ignore
  | E_aux (E_app (id, _), _) when string_of_id id = "None" ->
      Ignore
  | E_aux (E_app (id, [E_aux (_,a) as e]), _) when string_of_id id = "Some" ->
      Accept (pat, guard_opt, e, a)
  | E_aux (E_match (match_var, nested_arms), a) ->
      (match process_arms nested_arms with
      | Accept (pat', guard_opt', body, annot) ->
          let guard_opt = seq_guard pat' match_var guard_opt guard_opt' in
          let body = E_aux (E_let (LB_aux (LB_val (pat', match_var), a), body), annot) in
          Accept (pat, guard_opt, body, annot)
      | x -> x)
  | _ -> Reject

and process_arms arms = List.fold_left join Ignore (List.map process_arm arms)

(****************************************************************************
 * Main Transform Logic
 *****************************************************************************)

(* Transform a single __decode function body *)
let transform_decode_body body =
  match match_decode_template body with
  | Some (opcode_var, arms, match_annot, pat_annot)  ->
      (match process_arms arms with
      | Accept (pat, guard_opt, e, annot) ->
          let new_arm = construct_pexp (pat, guard_opt, e, pat_annot) in
          E_aux (E_match (opcode_var, [new_arm]), match_annot)
      | _ -> body)
  | None -> body

(* Transform a function definition if it's a __decode function *)
let transform_function_def (FD_aux (FD_function (rec_opt, tannot_opt, fcls), annot)) =
  match fcls with
  | [FCL_aux (FCL_funcl (func_id, pexp), fcl_annot)] ->
      let func_name = string_of_id func_id in
      if Asl_structure_analysis.is_instruction_function func_name then (
        let (pat, guard_opt, body, pexp_annot) = destruct_pexp pexp in
        let transformed_body = transform_decode_body body in
        let new_pexp = construct_pexp (pat, guard_opt, transformed_body, pexp_annot) in
        let new_fcl = FCL_aux (FCL_funcl (func_id, new_pexp), fcl_annot) in
        FD_aux (FD_function (rec_opt, tannot_opt, [new_fcl]), annot)
      ) else
        FD_aux (FD_function (rec_opt, tannot_opt, fcls), annot)
  | _ ->
      (* Multiple clauses - don't transform for now *)
      FD_aux (FD_function (rec_opt, tannot_opt, fcls), annot)

(* Transform a definition if it's a function definition *)
let transform_definition = function
  | DEF_aux (DEF_fundef fdef, annot) ->
      DEF_aux (DEF_fundef (transform_function_def fdef), annot)
  | other_def -> other_def

let apply_asl_decode_transforms ast =
  let defs = List.map transform_definition ast.defs in
  { ast with defs }

(****************************************************************************
 * Newtype Elimination Transform
 *****************************************************************************)

let eliminate_newtypes ast =
  (* Collect and translate newtypes *)
  let newtype_constructors = ref IdSet.empty in
  let defs = List.map (function
    | DEF_aux (DEF_type (TD_aux (TD_variant (type_id, typquant,
          [Tu_aux (Tu_ty_id (underlying_typ, ctor_id), _)], true), td_annot)), def_annot) ->
        newtype_constructors := IdSet.add ctor_id !newtype_constructors;
        DEF_aux (DEF_type (TD_aux (TD_abbrev (type_id, typquant,
          mk_typ_arg (A_typ underlying_typ)), td_annot)), def_annot)
    | def -> def) ast.defs in
  let ast = {ast with defs} in
  let is_newtype id = IdSet.mem id !newtype_constructors in

  (* Rewrite all uses of the newtype *)
  let exp_alg = {
    id_exp_alg with
    e_app = (fun (id, args) ->
      match args with
      | [E_aux (exp, single_annot)] when is_newtype id -> exp
      | _ -> E_app (id, args)
    );
  } in
  let pat_alg = {
    id_pat_alg with
    p_app = (fun (id, pats) ->
      match pats with
      | [P_aux (pat, single_annot) ] when is_newtype id -> pat
      | _ -> P_app (id, pats)
    );
  } in
  rewrite_exp_pat exp_alg pat_alg ast

(****************************************************************************
 * Union Elimination Transform
 ****************************************************************************)

(* Information about a union constructor - simplified approach *)
type union_constructor_info = {
  id: id;
  args: typ list;
  arg_start_pos: int;  (* Position where this constructor's args start in concatenated args *)
  arg_width: int;      (* Number of args this constructor has *)
}

(* Information about a union type - simplified approach *)
type union_type_info = {
  union_id: id;
  typquant: typquant;
  constructors: union_constructor_info list;
  all_args_concat: typ list;  (* Concatenation of all constructor arguments *)
}

let do_not_transform union_info = string_of_id union_info.union_id = "exception"
let eannot = (Parse_ast.Unknown, Type_check.empty_tannot)
let wild_pats n = List.init n (fun _ -> P_aux (P_wild, eannot))
let typ_substs substs typ  =
  List.fold_left (fun typ (var,ntyp) -> typ_subst var ntyp typ) typ substs
let undefined_exps args substs =
  List.map (fun typ ->
    let typ = typ_substs substs typ in
    let undef = E_aux (E_lit (L_aux (L_undef, Unknown)), eannot) in
    E_aux (E_typ (typ, undef), eannot)) args

(* Turn a type union into the constructor id and its argument list *)
let destruct_type_union (Tu_aux (Tu_ty_id(typ,id), _)) =
  match typ with
  | Typ_aux (Typ_id unit_id, _) when string_of_id unit_id = "unit" -> [], id
  | Typ_aux (Typ_tuple typs, _) -> typs, id
  | _ -> [typ], id

(* Collect the union and constructor information *)
let collect_union_info union_id typquant constructors =
  let all_args = ref [] in
  let start_pos = ref 0 in
  let constructors = List.map (fun c ->
    let args, id = destruct_type_union c in
    let arg_start_pos = !start_pos in
    let arg_width = List.length args in
    all_args := !all_args @ args;
    start_pos := !start_pos + arg_width;
    { id; args; arg_start_pos; arg_width; }
  ) constructors in
  { union_id; typquant; constructors; all_args_concat = !all_args; }

(* Generate enum definition from union type to represent the tag *)
let union_to_enum union_info td_annot def_annot =
  let enum_constructors = List.map (fun ctor -> ctor.id) union_info.constructors in
  let enum_def = TD_aux (TD_enum (union_info.union_id, enum_constructors, false), td_annot) in
  let skip = Some (Parse_ast.Attribute_data.AD_aux (AD_string "skip", Unknown)) in
  let undef_annot = add_def_attribute Unknown "undefined_gen" skip def_annot in
  DEF_aux (DEF_type enum_def, undef_annot)

(* Helper to unpack expression from tuples/units *)
let unpack_expressions args expected =
  match args, expected with
  (* No arguments, none expected. Single unit also encodes no arguments. *)
  | _, 0 -> []
  (*| [E_aux (E_lit (L_aux (L_unit, _)), _)], 0 -> []*)
  (* Lines up *)
  | l, i when List.length l = i -> l
  (* Unpack tuple *)
  | [E_aux (E_tuple t, _)], i when List.length t = i -> t
  | _ ->
      let p = (String.concat ", " (List.map string_of_exp args)) in
      let m = Printf.sprintf "Can't match up expressions with arg count %d: %s" expected p in
      failwith m

(* Helper to unpack patterns from tuples/units *)
let unpack_patterns pats expected =
  match pats, expected with
  (* No arguments, none expected. Single unit also encodes no arguments. *)
  | _, 0 -> []
  (*| [P_aux (P_lit (L_aux (L_unit, _)), _)], 0 -> []*)
  (* Lines up *)
  | l, i when List.length l = i -> l
  (* Unpack tuple *)
  | [P_aux (P_tuple tuple_pats, _)], i when List.length tuple_pats = i -> tuple_pats
  (* Wildcard can match any arg count *)
  | [P_aux (P_wild, _)] , i when i > 0 -> wild_pats expected
  | _ ->
      let p = (String.concat ", " (List.map string_of_pat pats)) in
      let m = Printf.sprintf "Can't match up patterns with arg count %d: %s" expected p in
      failwith m

(* Helper to inject a list into another at a given position *)
let list_set_at base pos args =
  let len = List.length args in
  List.mapi (fun i e ->
    let rel_pos = i - pos in
    let upd = rel_pos >= 0 && rel_pos < len in
    if upd then List.nth args rel_pos else e) base

(* Build a constructor call over the lowered structure *)
let build_expression ui ctor args substs =
  let args = unpack_expressions args ctor.arg_width in
  assert (List.length args = ctor.arg_width);
  let all_args = List.length ui.all_args_concat in
  if all_args = 0 then E_id ctor.id
  else
    let undefined = undefined_exps ui.all_args_concat substs in
    let filled = list_set_at undefined ctor.arg_start_pos args in
    E_tuple (E_aux (E_id ctor.id, (Unknown, Type_check.empty_tannot)) :: filled)

(* Build a pattern match over the lowered structure *)
let build_pattern ui ctor args =
  let args = unpack_patterns args ctor.arg_width in
  assert (List.length args = ctor.arg_width);
  let all_args = List.length ui.all_args_concat in
  if all_args = 0 then P_id ctor.id
  else
    let wild = wild_pats all_args in
    let filled = list_set_at wild ctor.arg_start_pos args in
    P_tuple (P_aux (P_id ctor.id, (Unknown, Type_check.empty_tannot))::filled)

let get_substs ui typ =
  try
    match typ, ui.typquant with
    | Typ_aux (Typ_app (union_typ_id, actual_args), _), TypQ_aux (TypQ_tq quant_items, _)
          when Id.compare union_typ_id ui.union_id = 0 ->
        let type_params = List.filter_map (function
        | QI_aux (QI_id (KOpt_aux (KOpt_kind (_, kid), _)), _) -> Some kid
        | _ -> None ) quant_items in
        List.fold_left2 (fun acc param arg ->
          match arg with
          | A_aux (A_typ arg_typ, _) -> (param, arg) :: acc
          | _ -> acc) [] type_params actual_args
    | _ -> []
  with _ -> []

(* Global map to store union transformation info *)

(* Helper to get type quantifier for a union type *)
let get_union_typquant union_id union_map =
  match Bindings.find_opt union_id union_map with
  | Some union_info -> union_info.typquant
  | None -> mk_typquant []

(* Helper to transform types - handles both regular types and union tuple building *)
let rec transform_type unions typ =
  match typ with
  | Typ_aux (Typ_id type_id, annot) ->
      (match Bindings.find_opt type_id unions with
      | Some ui when List.length ui.all_args_concat = 0 ->
          Typ_aux (Typ_id ui.union_id, Unknown)
      | Some ui ->
          let enum_typ = Typ_aux (Typ_id ui.union_id, Unknown) in
          let transformed_args = List.map (transform_type unions) ui.all_args_concat in
          Typ_aux (Typ_tuple (enum_typ :: transformed_args), Unknown)
      | None -> typ)
  | Typ_aux (Typ_app (id, typ_args), annot) ->
      (match Bindings.find_opt id unions with
      | Some ui when List.length ui.all_args_concat = 0 ->
          Typ_aux (Typ_id ui.union_id, Unknown)
      | Some union_info ->
          let type_params = quant_kopts union_info.typquant in
          let substs = List.map2 (fun param arg -> kopt_kid param, arg) type_params typ_args in
          let substituted_args = List.map (typ_substs substs) union_info.all_args_concat in
          let enum_typ = Typ_aux (Typ_id union_info.union_id, Unknown) in
          let transformed_args = List.map (transform_type unions) substituted_args in
          Typ_aux (Typ_tuple (enum_typ :: transformed_args), Unknown)
      | None -> typ)
  | _ -> typ

(* Helper to find union constructor info *)
let find_union_constructor_info unions ctor_id =
  Bindings.fold (fun _ ui acc ->
    match acc with
    | Some _ -> acc  (* Already found *)
    | None ->
        let ctor_opt = List.find_opt (fun ctor -> Id.compare ctor.id ctor_id = 0) ui.constructors in
        match ctor_opt with
        | Some ctor -> Some (ui, ctor)
        | None -> None
  ) unions None

let eliminate_unions ast =
  (* Collect all unions *)
  let union_info_map = ref (Bindings.empty)  in
  let defs = List.map (fun def ->
    match def with
    | DEF_aux (DEF_type (TD_aux (TD_variant (id, q, c, false), td_annot)), def_annot) ->
        let ui = collect_union_info id q c in
        if do_not_transform ui then def else begin
          union_info_map := Bindings.add id ui !union_info_map;
          union_to_enum ui td_annot def_annot
        end
    | _ -> def) ast.defs
  in
  let ast = { ast with defs } in

  (* Apply expression & pattern transform *)
  let exp_alg = {
    id_exp_alg with
    e_aux = (fun (exp_aux, (l, tannot)) ->
      match exp_aux with
      | E_app (ctor_id, args) ->
          (match find_union_constructor_info !union_info_map ctor_id with
          | Some (ui, ctor) ->
              let expr_typ = typ_of_tannot tannot in
              let substs = get_substs ui expr_typ in
              E_aux (build_expression ui ctor args substs, (l, tannot))
          | None ->
              E_aux (exp_aux, (l, tannot)))
      | _ -> E_aux (exp_aux, (l, tannot)));
  } in
  let pat_alg = {
    id_pat_alg with
    p_app = (fun (ctor_id, args) ->
      match find_union_constructor_info !union_info_map ctor_id with
      | Some (union, ctor) -> build_pattern union ctor args
      | None -> P_app (ctor_id, args)
    );
  } in
  let ast = rewrite_exp_pat exp_alg pat_alg ast in

  (* Eliminate 'mapping_match', it has some implications with option('a) *)
  let match_alg = {
    id_exp_alg with
    e_aux = (fun (exp_aux, (l, (tannot : tannot))) ->
      match exp_aux, get_attribute "mapping_match" (untyped_annot tannot) with
      | E_match (E_aux (E_match (e_inner, arms_inner), tannot_inner) as e_match, arms), Some _ -> 
          let (pat, guard_opt, body, pexp_annot) = destruct_pexp (List.hd arms_inner) in
          let typ = typ_of body in
          let tannot = Type_check.map_uannot (remove_attribute "mapping_match") tannot in
          E_aux (E_match (E_aux (E_typ (typ, e_match), tannot_inner), arms), (l, tannot))
      | _, _ -> 
          let tannot = Type_check.map_uannot (remove_attribute "mapping_match") tannot in
          E_aux (exp_aux, (l, tannot)) );
  } in
  let ast = rewrite_exp_pat match_alg id_pat_alg ast in

  (* Apply type transform *)
  let ast = transform_ast_types (transform_type !union_info_map) ast in

  (* Run the trivial match eliminate - wish we didn't have to but the type checker
     can't infer the type of a match? *)
  eliminate_trivial_matches ast

(****************************************************************************
 * Variable-Type Name Collision Avoidance Transform
 *****************************************************************************)

(* Eliminate variable-type name collisions by renaming variables *)
let escape_var_names ast =
  (* Stage 1: Collect all type identifiers from global definitions *)
  let type_names = ref IdSet.empty in
  type_names := IdSet.add (mk_id "integer") !type_names;
  type_names := IdSet.add (mk_id "boolean") !type_names;
  type_names := IdSet.add (mk_id "bit") !type_names;
  type_names := IdSet.add (mk_id "bits") !type_names;
  List.iter (function
    | DEF_aux (DEF_type (TD_aux (TD_abbrev (id, _, A_aux (A_nexp _, _)), _)), _) ->
        ()
    | DEF_aux (DEF_type (TD_aux (td, td_annot) as typedef), _) ->
        let type_id = id_of_type_def typedef in
        type_names := IdSet.add type_id !type_names
    | _ -> ()
  ) ast.defs;

  (* Utility to escape an id and avoid collision *)
  let escape_var_name id =
    let name = string_of_id id |>
      Str.global_replace (Str.regexp "X") "XX" |>
        Str.global_replace (Str.regexp "#") "XH" |>
          Str.global_replace (Str.regexp "'") "XQ"
    in
    let id = mk_id name in
    if IdSet.mem id !type_names then mk_id (name ^ "XN")
    else if name = "AND" then mk_id "AND_XN"
    else if name = "OR" then mk_id "OR_XN"
    else id
  in

  (* Stage 2: Expression algebra to rename colliding ids *)
  let exp_alg = {
    id_exp_alg with
    e_id = (fun id -> E_id (escape_var_name id));
    le_id = (fun id -> LE_id (escape_var_name id));
    le_typ = (fun (typ,id) -> LE_typ(typ, escape_var_name id));
  } in

  (* Stage 3: Pattern algebra to rename colliding ids *)
  let pat_alg = {
    id_pat_alg with
    p_id = (fun id -> P_id (escape_var_name id));
  } in

  (* Stage 4: Definition rewriter to handle TD_enum identifiers *)
  let rewrite_def rewriters def =
    match def with
    | DEF_aux (DEF_type (TD_aux (TD_enum(type_id, enum_ids, is_exhaustive), td_annot)), def_annot) ->
        (* Escape enum constructor identifiers and add undefined_gen skip attribute *)
        let escaped_enum_ids = List.map escape_var_name enum_ids in
        let escaped_td = TD_aux (TD_enum(type_id, escaped_enum_ids, is_exhaustive), td_annot) in
        DEF_aux (DEF_type escaped_td, def_annot)
    | _ ->
        (* Apply standard definition rewriting *)
        rewriters_base.rewrite_def rewriters def
  in

  (* Stage 5: Apply the transformation *)
  let collision_elimination_rewriters = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp { exp_alg with pat_alg = pat_alg } exp);
    rewrite_pat = (fun _rewriters pat -> fold_pat pat_alg pat);
    rewrite_def = rewrite_def;
  } in

  rewrite_ast_base collision_elimination_rewriters ast

(****************************************************************************
 * For Loop Stride Normalization Transform
 *****************************************************************************)

(* Normalize for loops to have stride 1 by transforming the loop variable *)
let normalize_for_loop_strides ast =
  (* Generate fresh variable name *)
  let fresh_var_name base_name =
    mk_id (string_of_id base_name ^ "XL")
  in
  let one = Big_int.of_int 1 in
  let get_int = function
    | E_aux (E_lit (L_aux (L_num i, l)), annot) -> Some (i, (l, annot))
    | _ -> None
  in
  let make_int i (l,annot) = E_aux (E_lit (L_aux (L_num i, l)), annot) in
  let mult_of a b = Big_int.modulus a b = Big_int.zero in

  (* Expression rewriter *)
  let exp_alg = {
    id_exp_alg with
    e_for = (fun (id, from_exp, to_exp, step_exp, order, body) ->
      (* Check if step is not 1 *)
      match get_int from_exp, get_int to_exp, get_int step_exp with
      | _, _, Some(step_val, _) when Big_int.equal step_val one ->
          E_for (id, from_exp, to_exp, step_exp, order, body)
      | Some (from_val, from_annot), Some(to_val, to_annot), Some(step_val, step_annot)
            when mult_of from_val step_val && mult_of to_val step_val ->
          let fresh_var = fresh_var_name id in
          let new_from = make_int (Big_int.div from_val step_val) from_annot in
          let new_to   = make_int (Big_int.div to_val step_val) to_annot in
          let new_step = make_int one step_annot in
          let tannot = snd step_annot in
          (* Create let binding for original variable: let id = fresh_var * step_int *)
          let mult_exp = E_aux (E_app (mk_id "mult_atom", [
                  E_aux (E_id fresh_var, tannot);
                  make_int step_val step_annot]), tannot) in
          let let_binding = LB_aux (LB_val (P_aux (P_id id, tannot), mult_exp), tannot) in
          let wrapped_body = E_aux (E_let (let_binding, body), tannot) in

          E_for (fresh_var, new_from, new_to, new_step, order, wrapped_body)
      | _ ->
          (* TODO: Will be a problem down the line *)
          E_for (id, from_exp, to_exp, step_exp, order, body)
    );
  } in

  (* Apply the transformation *)
  let stride_normalization_rewriters = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp exp_alg exp);
  } in

  rewrite_ast_base stride_normalization_rewriters ast

(****************************************************************************
 * Match Expression Variable Binding Elimination Transform
 *****************************************************************************)

(* Generate fresh variable names for match temporaries *)
let fresh_match_var_counter = ref 0
let fresh_match_var base_name =
  incr fresh_match_var_counter;
  mk_id (base_name ^ "_match_" ^ string_of_int !fresh_match_var_counter)

(* Replace variable bindings in pattern with wildcards, return binding pattern *)
let rec extract_bindings_from_pattern original_pat =
  match original_pat with
  | P_aux (P_wild, annot) ->
      (P_aux (P_wild, annot), P_aux (P_wild, annot))
  | P_aux (P_lit lit, annot) ->
      (P_aux (P_lit lit, annot), P_aux (P_wild, annot))
  | P_aux (P_id id, annot) ->
      let env = env_of_annot annot in
      (match Env.lookup_id id env with
      | Local _ | Unbound _ ->
          (* Variable binding: replace with wildcard in match, keep in binding *)
          (P_aux (P_wild, annot), P_aux (P_id id, annot))
      | Enum _ | Register _ ->
          (* Constructor pattern: keep in match, wildcard in binding *)
          (P_aux (P_id id, annot), P_aux (P_wild, annot)))
  | P_aux (P_tuple pats, annot) ->
      let match_pats, binding_pats = List.split (List.map extract_bindings_from_pattern pats) in
      (P_aux (P_tuple match_pats, annot), P_aux (P_tuple binding_pats, annot))
  | P_aux (P_typ (typ, inner_pat), annot) ->
      let match_pat, binding_pat = extract_bindings_from_pattern inner_pat in
      (P_aux (P_typ (typ, match_pat), annot), P_aux (P_typ (typ, binding_pat), annot))
  | P_aux (P_as (inner_pat, id), annot) ->
      let match_pat, binding_pat = extract_bindings_from_pattern inner_pat in
      (* Keep the 'as' pattern in the match, but add variable binding *)
      (P_aux (P_as (match_pat, id), annot), P_aux (P_id id, annot))
  | P_aux (_, _) ->
      Printf.printf "Cannot handle pattern: %s\n" (string_of_pat original_pat);
      failwith "bad pattern"

(* Check if binding pattern is all wildcards (no bindings needed) *)
let rec pattern_is_all_wildcards = function
  | P_aux (P_wild, _) -> true
  | P_aux (P_tuple pats, _) -> List.for_all pattern_is_all_wildcards pats
  | P_aux (P_typ (_, inner_pat), _) -> pattern_is_all_wildcards inner_pat
  | _ -> false

(* Transform a single match arm *)
let transform_match_arm match_var arm =
  let (original_pat, guard_opt, body, arm_annot) = destruct_pexp arm in
  let (match_pat, binding_pat) = extract_bindings_from_pattern original_pat in

  (* Wrap body in let binding if there are variables to bind *)
  let new_body =
    if pattern_is_all_wildcards binding_pat then
      body
    else
      let let_binding = LB_aux (LB_val (binding_pat, match_var), arm_annot) in
      E_aux (E_let (let_binding, body), arm_annot)
  in

  construct_pexp (match_pat, guard_opt, new_body, arm_annot)

(* Transform a match expression *)
let eliminate_match_variable_bindings (match_exp, arms) =
  (* Store match expression in a fresh variable *)
  let match_var_id = fresh_match_var "XM" in
  let match_typ = Type_check.typ_of match_exp in
  let match_tannot = mk_tannot Type_check.Env.empty match_typ in
  let match_annot = (Parse_ast.Unknown, match_tannot) in
  let match_var = E_aux (E_id match_var_id, match_annot) in

  (* Transform all arms *)
  let new_arms = List.map (transform_match_arm match_var) arms in

  (* Create the new match with transformed arms *)
  let new_match = E_aux (E_match (match_var, new_arms), match_annot) in

  (* Wrap in let binding for match variable *)
  let let_binding = LB_aux (LB_val (P_aux (P_id match_var_id, match_annot), match_exp), match_annot) in
  E_let (let_binding, new_match)

(* Main transform function *)
let eliminate_match_expressions ast =
  let exp_alg = {
    id_exp_alg with
    e_case = fun (m,arms) ->
      try
        eliminate_match_variable_bindings (m,arms)
      with _ -> E_match (m,arms)
  } in
  let elimination_rewriters = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp exp_alg exp);
  } in
  rewrite_ast_base elimination_rewriters ast

(****************************************************************************
 * Type Alias Elimination Transform
 *
 * Substitutes type aliases (TD_abbrev) for Typ_id cases only.
 *****************************************************************************)

(* Collect type aliases from definitions *)
let collect_type_aliases defs =
  let aliases = ref Bindings.empty in
  List.iter (function
    | DEF_aux (DEF_type (TD_aux (TD_abbrev (alias_id, _, typ_arg), _)), _) ->
        (match typ_arg with
        | A_aux (A_typ typ, _) ->
            aliases := Bindings.add alias_id typ !aliases
        | _ -> ())
    | _ -> ()
  ) defs;
  !aliases

(* Substitute type aliases for Typ_id only *)
let rec substitute_type_aliases aliases typ =
  match typ with
  | Typ_aux (Typ_id alias_id, _) ->
      (match Bindings.find_opt alias_id aliases with
      | Some replacement_typ -> substitute_type_aliases aliases replacement_typ
      | None -> typ)
  | _ -> typ

(* Main type alias elimination function *)
let eliminate_type_aliases info ast =
  let aliases = collect_type_aliases ast.defs in
  let info = transform_instruction_info_types (substitute_type_aliases aliases) info in
  (info, transform_ast_types (substitute_type_aliases aliases) ast)

(****************************************************************************
 * Tuple Collapse Transform
 *
 * Removes unit members from tuples and replaces E_id with unit type with
 * unit literals. If tuple reduces to single element, replaces with that element.
 *****************************************************************************)

(* Check if a type is unit, resolving type aliases through environment *)
let is_unit_type (Typ_aux (t, _)) =
  match t with
  | Typ_id id when string_of_id id = "unit" -> true
  | _ -> false

(* Filter out unit types from a list, returning indices of non-unit types *)
let filter_non_unit_indices typs =
  List.mapi (fun i typ -> (i, typ)) typs
  |> List.filter (fun (_, typ) -> not (is_unit_type typ))
  |> List.map fst

(* Filter elements by indices *)
let filter_by_indices indices elements =
  List.mapi (fun i elem -> (i, elem)) elements
  |> List.filter (fun (i, _) -> List.mem i indices)
  |> List.map snd

(* Transform tuple expressions by removing unit members *)
let transform_tuple_expr exprs typs annot =
  let non_unit_indices = filter_non_unit_indices typs in
  let filtered_exprs = filter_by_indices non_unit_indices exprs in
  match filtered_exprs with
  | [] -> E_aux (E_lit (L_aux (L_unit, Parse_ast.Unknown)), annot)
  | [single_expr] -> single_expr
  | _ -> E_aux (E_tuple filtered_exprs, annot)

(* Transform tuple patterns by removing unit members *)
let transform_tuple_pattern pats typs annot =
  let non_unit_indices = filter_non_unit_indices typs in
  let filtered_pats = filter_by_indices non_unit_indices pats in
  match filtered_pats with
  | [] -> P_aux (P_lit (L_aux (L_unit, Parse_ast.Unknown)), annot)
  | [single_pat] -> single_pat
  | _ -> P_aux (P_tuple filtered_pats, annot)

(* Transform tuple types by removing unit members *)
let transform_tuple_type typs =
  let non_unit_indices = filter_non_unit_indices typs in
  let filtered_typs = filter_by_indices non_unit_indices typs in
  match filtered_typs with
  | [] -> Typ_aux (Typ_id (mk_id "unit"), Parse_ast.Unknown)
  | [single_typ] -> single_typ
  | _ -> Typ_aux (Typ_tuple filtered_typs, Parse_ast.Unknown)

(* Main tuple collapse transform *)
let collapse_tuples ast =
  let exp_alg = {
    id_exp_alg with
    e_aux = (fun (e, (l, tannot)) ->
      let typ = typ_of_tannot tannot in
      match e with
      | E_tuple exprs when List.length exprs > 0 ->
          let typs = List.map typ_of exprs in
          transform_tuple_expr exprs typs (l, tannot)
      | E_app (id, args) ->
          let non_unit_args = List.filter (fun arg -> not (is_unit_type (typ_of arg))) args in
          let final_args = match non_unit_args with
            | [] when List.length args > 0 ->
                (* If all args were unit, keep a single unit literal *)
                [E_aux (E_lit (L_aux (L_unit, l)), (l, tannot))]
            | _ -> non_unit_args
          in
          E_aux (E_app (id, final_args), (l, tannot))
      | E_typ (ann_typ, inner_exp) when is_unit_type ann_typ ->
          E_aux (E_lit (L_aux (L_unit, l)), (l, tannot))
      | E_id id when is_unit_type typ ->
          E_aux (E_lit (L_aux (L_unit, l)), (l,tannot))
      | _ -> E_aux (e, (l, tannot))
    );
  } in

  let pat_alg = {
    id_pat_alg with
    p_aux = (fun (p, (l, tannot)) ->
      let typ = typ_of_tannot tannot in
      match p with
      | P_tuple pats when List.length pats > 0 ->
          let typs = List.map typ_of_pat pats in
          transform_tuple_pattern pats typs (l, tannot)
      | P_typ (ann_typ, inner_pat) when is_unit_type ann_typ ->
          P_aux (P_lit (L_aux (L_unit, l)), (l, tannot))
      | P_id id when is_unit_type typ ->
          P_aux (P_lit (L_aux (L_unit, l)), (l, tannot))
      | _ -> P_aux (p, (l, tannot))
    );
  } in

  let rewrite_def rewriters def =
    match def with
    | DEF_aux (DEF_val (VS_aux (VS_val_spec (typschm, id, externs), vs_annot)), def_annot) ->
        let transform_typschm = function
          | TypSchm_aux (TypSchm_ts (typq, typ), annot) ->
              let rec transform_function_type = function
                | Typ_aux (Typ_fn (arg_typs, ret_typ), t_annot) ->
                    let non_unit_args = List.filter (fun typ -> not (is_unit_type typ)) arg_typs in
                    let final_args = match non_unit_args with
                      | [] -> (match arg_typs with
                               | hd :: _ -> [hd]  (* Keep first argument if all were unit *)
                               | [] -> [])        (* Keep empty if originally empty *)
                      | args -> args             (* Use filtered args *)
                    in
                    Typ_aux (Typ_fn (final_args, transform_function_type ret_typ), t_annot)
                | other_typ -> other_typ
              in
              TypSchm_aux (TypSchm_ts (typq, transform_function_type typ), annot)
        in
        let transformed_typschm = transform_typschm typschm in
        DEF_aux (DEF_val (VS_aux (VS_val_spec (transformed_typschm, id, externs), vs_annot)), def_annot)
    | _ ->
        rewriters_base.rewrite_def rewriters def
  in

  let collapse_rewriters = {
    rewriters_base with
    rewrite_exp = (fun _rewriters exp -> fold_exp { exp_alg with pat_alg } exp);
    rewrite_pat = (fun _rewriters pat -> fold_pat pat_alg pat);
    rewrite_def = rewrite_def;
  } in

  let ast = rewrite_ast_base collapse_rewriters ast in

  (* Apply type transformation to handle Typ_tuple *)
  let type_transform_fn typ =
    match typ with
    | Typ_aux (Typ_tuple typs, _) ->
        transform_tuple_type typs
    | other -> other
  in

  transform_ast_types type_transform_fn ast
