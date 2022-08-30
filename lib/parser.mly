%{
open Ast
%}

%token LPAREN
%token RPAREN
%token EOF
%token <int> INT
%token PLUS MIN MUL DIV

%left PLUS MIN
%left MUL DIV

%start <Ast.expr> prog

%%

prog:
  | e = expr EOF { e }

expr:
  | e1 = expr; PLUS ; e2 = expr { BinOp (e1, "+", e2) }
  | e1 = expr; MIN ; e2 = expr { BinOp (e1, "-", e2) }
  | e1 = expr; MUL ; e2 = expr { BinOp (e1, "*", e2) }
  | e1 = expr; DIV ; e2 = expr { BinOp (e1, "/", e2) }
  | LPAREN; e = expr; RPAREN { e }
  | i = INT { Int i }

