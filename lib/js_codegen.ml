let rec codegen = function
    Ast.Int n -> string_of_int n
    | Ast.BinOp (lh, op, rh) -> "(" ^ codegen lh ^ ")" ^ op ^ "(" ^codegen rh ^")"
