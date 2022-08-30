%{
open Ast
%}

%token LPAREN
%token RPAREN
%token EOF
%token <int> INT
%token PLUS

%left PLUS

%start <Ast.expr> prog

%%

prog:
  | e = expr EOF { e }

expr:
  | LPAREN; e = expr; RPAREN { e }
  | i = INT { Int i }
  | e1 = expr; PLUS; e2 = expr { Plus (e1, e2) }
