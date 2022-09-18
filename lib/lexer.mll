{
open Parser
}

let digit = ['0'-'9']
let number = '-'? digit digit*
let whitespace = ['\t' ' ' '\n']
let alpha = ['a'-'z' 'A'-'Z']
let op = ['!' '#' '$' '%' '&' '*' '+' '/' '<' '=' '>' '?' '@' '^' '|' '-' '~']
let ident = alpha+

rule tokenize = parse
  | whitespace+ { tokenize lexbuf }
  | "let" { LET }
  | "if" { IF }
  | "else" { ELSE }
  | "true" { TRUE }
  | "false" { FALSE }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "{" { LBRACE }
  | "}" { RBRACE }
  | "," { COMMA }
  | ";" { SEMICOLON }
  | number as n { INT (int_of_string n ) }
  | ident as s { Ident s }
  | op+ as lexeme {
      match lexeme with
      | "=" -> ASSIGN
      | _ -> match lexeme.[0] with
          | '|' -> OP0 lexeme
          | '^' -> OP1 lexeme
          | '&' -> OP2 lexeme
          | '=' | '!' -> OP3 lexeme
          | '<' | '>' -> OP4 lexeme
          | '+' | '-' -> OP5 lexeme
          | '*' | '%' -> OP6 lexeme
          | _ -> OP7 lexeme
  }
  | eof { EOF }
