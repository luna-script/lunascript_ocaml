%{
open Ast
%}

%token LPAREN RPAREN
%token LBRACE RBRACE
%token EOF
%token <int> INT
%token PLUS MIN MUL DIV
%token IF ELSE
%token TRUE FALSE

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
  | IF; cond = expr; LBRACE; then_expr = expr; RBRACE; ELSE; LBRACE; else_expr = expr; RBRACE; {
      If (cond, then_expr, else_expr)
  }
  | LPAREN; e = expr; RPAREN { e }
  | TRUE { Bool true }
  | FALSE { Bool false }
  | i = INT { Int i }

