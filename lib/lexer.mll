{
open Parser
}

let digit = ['0'-'9']
let number = '-'? digit digit*
let whitespace = ['\t' ' ' '\n']

rule tokenize = parse
  | whitespace+ { tokenize lexbuf }
  | "if" { IF }
  | "else" { ELSE }
  | "true" { TRUE }
  | "false" { FALSE }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "{" { LBRACE }
  | "}" { RBRACE }
  | number as n { INT (int_of_string n ) }
  | "+" { PLUS }
  | "-" { MIN }
  | "*" { MUL }
  | "/" { DIV }
  | eof { EOF }
