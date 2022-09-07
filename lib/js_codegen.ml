let rec expr_codegen = function
  | Ast.Int n -> string_of_int n
  | Ast.BinOp (lh, op, rh) -> "(" ^ expr_codegen lh ^ op ^ expr_codegen rh ^ ")"
  | Ast.If (cond, then_expr, else_expr) ->
      "(" ^ expr_codegen cond ^ "?" ^ expr_codegen then_expr ^ ":"
      ^ expr_codegen else_expr ^ ")"
  | Ast.Bool b -> string_of_bool b
  | Ast.Var ident -> ident
  | Ast.Fun (arg, expr) -> "(" ^ arg ^ ") => " ^ "(" ^ expr_codegen expr ^ ")"
  | Ast.App (expr1, expr2) ->
      "(" ^ expr_codegen expr1 ^ ")(" ^ expr_codegen expr2 ^ ")"
  | Ast.Block (stmts, expr) ->
      "((()=>{\n" ^ codegen stmts ^ "return " ^ expr_codegen expr ^ "\n})())"

and codegen = function
  | [] -> ""
  | x :: xs -> (
      match x with
      | Ast.Assign (ident, expr) ->
          "const " ^ ident ^ " = " ^ expr_codegen expr ^ ";\n" ^ codegen xs
      | Ast.StmtExpr expr -> expr_codegen expr ^ ";\n" ^ codegen xs)
