{
open Parser
}

let digit = ['0'-'9']
let number = '-'? digit digit*
let whitespace = ['\t' ' ' '\n']
let alpha = ['a'-'z' 'A'-'Z']
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
  | number as n { INT (int_of_string n ) }
  | ident as s { Ident s }
  | "==" { EQ }
  | "=" { ASSIGN }
  | ">" { GT }
  | "<" { LT }
  | "+" { PLUS }
  | "-" { MIN }
  | "*" { MUL }
  | "/" { DIV }
  | ";" { SEMICOLON }
  | eof { EOF }
