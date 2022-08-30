open Lib

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parser.prog Lexer.tokenize lexbuf in
  print_string (Js_codegen.codegen expr)
