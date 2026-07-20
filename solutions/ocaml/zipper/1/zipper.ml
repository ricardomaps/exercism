open Base

type 'a branch = Left of 'a * 'a Tree.t option | Right of 'a * 'a Tree.t option [@@deriving sexp, equal]
type 'a t = { focus : 'a Tree.t; ctx : 'a branch list; } [@@deriving sexp, equal]

let parent branch tree = 
  match branch with
  | Left x r -> { value = x; left = Some tree; right = r; }
  | Right x l -> { value = x; left = l; right = Some tree; }

let of_tree t = { focus = t; ctx = []; }

let to_tree z =
    List.fold z.ctx ~init:(z.focus) ~f:parent

let value z = z.focus.value

let left z =
    Option.map z.focus.left
        ~f:(fun l -> { focus = l; ctx = Left z.focus.value z.focus.right :: z.ctx; })

let right z =
    Option.map z.focus.right
        ~f:(fun r -> { focus = r; ctx = Right z.focus.value z.focus.left :: z.ctx; })

let up z =
    match z.ctx with
    | [] -> None
    | b :: ctx -> Some { focus = parent b z.focus; ctx }

let set_value v z = { z with focus = { z.focus with value = v; }; }

let set_left l z = { z with focus = { z.focus with left = l; }; }

let set_right r z = { z with focus = { z.focus with right = r; }; }
