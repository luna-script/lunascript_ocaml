type expr =
  | Int of int
  | Bool of bool
  | BinOp of expr * string * expr
  | If of expr * expr * expr
  | Var of string
  | Fun of string * expr
  | App of expr * expr
[@@deriving show, eq]

type statement = Assign of string * expr | StmtExpr of expr
