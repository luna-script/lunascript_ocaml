
(* The type of tokens. *)

type token = 
  | TRUE
  | SEMICOLON
  | RPAREN
  | RBRACE
  | OP7 of (string)
  | OP6 of (string)
  | OP5 of (string)
  | OP4 of (string)
  | OP3 of (string)
  | OP2 of (string)
  | OP1 of (string)
  | OP0 of (string)
  | LPAREN
  | LET
  | LBRACE
  | Ident of (string)
  | INT of (int)
  | IF
  | FALSE
  | EOF
  | ELSE
  | COMMA
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.statement list)
