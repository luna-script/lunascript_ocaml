type expr =
  | Int of int
  | Bool of bool
  | BinOp of expr * string * expr
  | If of expr * expr * expr
  | Var of string
  | Fun of string * expr
  | App of expr * expr
  | Block of statement list * expr
[@@deriving show, eq]

and statement = Assign of string * expr | StmtExpr of expr
