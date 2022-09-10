open Lib

let _ =
  let str = ref "" in
  let rec repl () =
    print_string "?>";
    let input = read_line () in
    str := if !str = "" then input else !str ^ ";\n" ^ input;
    let lexbuf = Lexing.from_string !str in
    let expr = Parser.prog Lexer.tokenize lexbuf in
    print_string (Js_codegen.codegen expr);
    repl ()
  in
  repl ()
