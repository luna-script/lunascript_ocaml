%{
open Ast
%}

%token LPAREN RPAREN
%token LBRACE RBRACE
%token EOF SEMICOLON
%token <int> INT
%token <string> Ident
%token PLUS MIN MUL DIV
%token IF ELSE
%token TRUE FALSE
%token EQ GT LT
%token ASSIGN

%nonassoc EQ GT LT
%left PLUS MIN
%left MUL DIV

%start <Ast.statement list> prog

%%

prog:
  | ss = separated_list(SEMICOLON, statement); EOF { ss }

statement:
  | s = Ident; ASSIGN; e = expr { Assign (s, e) }
  | e = expr { StmtExpr e }

expr:
  | e1 = expr; PLUS ; e2 = expr { BinOp (e1, "+", e2) }
  | e1 = expr; MIN ; e2 = expr { BinOp (e1, "-", e2) }
  | e1 = expr; MUL ; e2 = expr { BinOp (e1, "*", e2) }
  | e1 = expr; DIV ; e2 = expr { BinOp (e1, "/", e2) }
  | e1 = expr; EQ ; e2 = expr { BinOp (e1, "==", e2) }
  | e1 = expr; GT ; e2 = expr { BinOp (e1, ">", e2) }
  | e1 = expr; LT ; e2 = expr { BinOp (e1, "<", e2) }
  | ident = Ident { Var ident }
  | IF; cond = expr; LBRACE; then_expr = expr; RBRACE; ELSE; LBRACE; else_expr = expr; RBRACE; {
      If (cond, then_expr, else_expr)
  }
  | LPAREN; e = expr; RPAREN { e }
  | TRUE { Bool true }
  | FALSE { Bool false }
  | i = INT { Int i }

