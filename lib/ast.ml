type expr = 
    | Int of int
    | Bool of bool
    | BinOp of expr * string * expr
    | If of expr * expr * expr
[@@deriving show, eq]
