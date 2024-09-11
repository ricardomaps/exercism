open Base

type bst = Nil | Node of (bst * int * bst)

let empty: bst = Nil

let value = function
    | Nil -> Error "tree is Nil"
    | Node (_, v, _) -> Ok v

let left = function
    | Nil -> Error "tree is Nil"
    | Node (l, _, _) -> Ok l

let right = function
    | Nil -> Error "tree is Nil"
    | Node (_, _, r) -> Ok r

let rec insert v = function
    | Nil -> Node (Nil, v, Nil)
    | Node (l, v2, r) when v2 >= v -> Node(insert v l, v2, r)
    | Node (l, v2, r) -> Node(l, v2, insert v r)

let rec to_list = function
    | Nil -> []
    | Node(l , v, r) -> (to_list l) @ v @ (to_list r)
    
    

