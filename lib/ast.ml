type expr =
  | Int of int
  | Bool of bool
  | BinOp of expr * string * expr
  | If of expr * expr * expr
  | Var of string
[@@deriving show, eq]

type statement = Assign of string * expr | StmtExpr of expr
