type expr = 
    | Int of int
    | Plus of expr * expr
[@@deriving show, eq]
