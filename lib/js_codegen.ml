let rec codegen = function
    Ast.Int n -> string_of_int n
    | Ast.Plus (lh, rh) -> codegen lh ^ "+" ^ codegen rh
