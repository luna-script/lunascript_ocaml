%{
open Ast

exception SyntaxError of string
%}

%token LPAREN RPAREN
%token LBRACE RBRACE
%token EOF SEMICOLON
%token <int> INT
%token <string> Ident
%token IF ELSE
%token TRUE FALSE
%token ASSIGN
%token COMMA
%token LET
%token <string> OP0 OP1 OP2 OP3 OP4 OP5 OP6 OP7 

%left OP0
%left OP1
%left OP2
%left OP3
%left OP4
%left OP5
%left OP6
%left OP7

%start <Ast.statement list> prog

%%

prog:
  | ss = separated_list(SEMICOLON, statement); EOF { ss }

statement:
  | LET; s = Ident; LPAREN; args = separated_list(COMMA, Ident); RPAREN; ASSIGN; e = expr { 
      let expr = List.fold_right (fun x -> fun acm -> Ast.Fun (x, acm)) args e in
      Assign (s, expr) 
  }
  | LET; s = Ident; ASSIGN; e = expr { Assign (s, e) }
  | e = expr { StmtExpr e }

expr:
  | e1 = expr; op = OP0 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP1 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP2 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP3 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP4 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP5 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP6 ; e2 = expr { BinOp (e1, op, e2) }
  | e1 = expr; op = OP7 ; e2 = expr { BinOp (e1, op, e2) }
  | e = app { e }
  | e = block_expr { e }
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
  | IF; cond = expr; then_expr = block_expr; ELSE; else_expr = block_expr {
      If (cond, then_expr, else_expr)
  }
  | IF; cond = expr; then_expr = block_expr; ELSE; else_expr = if_expr; {
      If (cond, then_expr, else_expr)
  }

block_expr:
  | LBRACE; stmts = separated_list(SEMICOLON, statement); RBRACE {
      match List.rev stmts with
      | (StmtExpr e)::[] -> e
      | (StmtExpr e)::rev_stmts -> Block (List.rev rev_stmts, e)
      | _ -> raise (SyntaxError "A block expression must end with an expression")
  }
