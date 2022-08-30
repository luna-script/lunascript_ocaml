{
open Parser
}

let digit = ['0'-'9']
let number = '-'? digit digit*
let whitespace = ['\t' ' ' '\n']

rule tokenize = parse
  | whitespace+ { tokenize lexbuf }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "+" { PLUS }
  | number as n { INT (int_of_string n ) }
  | eof { EOF }
