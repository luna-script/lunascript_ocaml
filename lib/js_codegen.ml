let rec codegen = function
    Ast.Int n -> string_of_int n
    | Ast.BinOp (lh, op, rh) -> "(" ^ codegen lh ^ op ^ codegen rh ^")"
    | Ast.If (cond, then_expr, else_expr) -> "(" ^ codegen cond ^ "?" ^ codegen then_expr ^ ":" ^ codegen else_expr ^ ")"
    | Ast.Bool b -> string_of_bool b

