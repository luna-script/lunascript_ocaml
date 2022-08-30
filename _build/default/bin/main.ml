open Lib

let rec eval = function
  | Ast.Int n -> n
  | Ast.Plus (n, m) -> eval n + eval m

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parser.prog Lexer.tokenize lexbuf in
  Printf.printf "%s = %d\n" (Ast.show_expr expr) (eval expr)
