open Base
type base = int

let get_int b l = List.rev l |> List.mapi ~f:(fun i x -> (b ** i) * x) |> List.fold_left ~init:0 ~f:(+)

let rec to_base_aux b n i acc =
         if n = 0 then if List.is_empty acc then [0] else acc
         else
         let pow = Int.pow b i in
         let r = n % pow in
         to_base_aux b (n - r) (i+1) ((r/(pow/b))::acc)

let to_base b n = to_base_aux b n 1 []

let convert_bases ~from ~digits ~target = 
    if from < 2 || target < 2 || List.exists ~f:(fun a -> a >= from || a < 0) digits then None else
    let result = to_base target (get_int from digits) 
    in Some (result)