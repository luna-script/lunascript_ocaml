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
%token COMMA
%token LET

%nonassoc EQ GT LT
%left PLUS MIN
%left MUL DIV

%start <Ast.statement list> prog

%%

prog:
  | ss = list(statement); EOF { ss }

statement:
  | LET; s = Ident; LPAREN; args = separated_list(COMMA, Ident); RPAREN; ASSIGN; e = expr; SEMICOLON { 
      let expr = List.fold_right (fun x -> fun acm -> Ast.Fun (x, acm)) args e in
      Assign (s, expr) 
  }
  | LET; s = Ident; ASSIGN; e = expr; SEMICOLON { Assign (s, e) }
  | e = expr; SEMICOLON { StmtExpr e }

expr:
  | e1 = expr; PLUS ; e2 = expr { BinOp (e1, "+", e2) }
  | e1 = expr; MIN ; e2 = expr { BinOp (e1, "-", e2) }
  | e1 = expr; MUL ; e2 = expr { BinOp (e1, "*", e2) }
  | e1 = expr; DIV ; e2 = expr { BinOp (e1, "/", e2) }
  | e1 = expr; EQ ; e2 = expr { BinOp (e1, "==", e2) }
  | e1 = expr; GT ; e2 = expr { BinOp (e1, ">", e2) }
  | e1 = expr; LT ; e2 = expr { BinOp (e1, "<", e2) }
  | e = app { e }
  | ident = Ident { Var ident }
  | e = if_expr { e }
  | LPAREN; e = expr; RPAREN { e }
  | TRUE { Bool true }
  | FALSE { Bool false }
  | i = INT { Int i }

app:
  | e1 = expr; LPAREN; args = separated_list(COMMA, expr); RPAREN {
      List.fold_left (fun acm -> fun e -> Ast.App (acm, e)) e1 args
  }

if_expr:
  | IF; cond = expr; LBRACE; then_expr = expr; RBRACE; ELSE; LBRACE; else_expr = expr; RBRACE; {
      If (cond, then_expr, else_expr)
  }
  | IF; cond = expr; LBRACE; then_expr = expr; RBRACE; ELSE; else_expr = if_expr; {
      If (cond, then_expr, else_expr)
  }

