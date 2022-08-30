type expr = 
    | Int of int
    | BinOp of expr * string * expr
    | If of expr * expr * expr
[@@deriving show, eq]
