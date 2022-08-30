type expr = 
    | Int of int
    | BinOp of expr * string * expr
[@@deriving show, eq]
