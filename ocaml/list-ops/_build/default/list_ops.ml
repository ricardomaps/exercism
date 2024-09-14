let rec length_aux l acc = 
    match l with
    | [] -> acc
    | _ :: tl -> length_aux tl (acc+1)

let length l =       
  length_aux l 0

let rec reverse_aux l acc = 
    match l with 
    | [] -> acc
    | h :: t -> reverse_aux t (h::acc)

let reverse l =
  reverse_aux l []

let rec map_aux f l acc =
    match l with
    | [] -> reverse acc
    | hd :: tl -> map_aux f tl ((f hd)::acc)

let map ~f l =
    map_aux f l []

let rec filter_aux f l acc =
    match l with
    | [] -> reverse acc
    | hd::tl-> if f hd then filter_aux f tl (hd::acc)
               else filter_aux f tl acc

let filter ~f l =
    filter_aux f l []

let rec fold ~init ~f l =
    match l with
    | [] -> init
    | hd :: tl -> fold ~init:(f init hd) ~f:f tl

let rec append_aux l1 l2 acc =
    match l1, l2 with
    | [], [] -> reverse acc
    | [], h :: t -> append_aux l1 t (h :: acc)
    | h :: t, _ -> append_aux t l2 (h :: acc)

let append l1 l2 =
    append_aux l1 l2 []

let rec concat_aux l acc =
    match l with
    | [] -> reverse acc
    | [] :: l -> concat_aux l acc
    | (x :: xs) :: l -> concat_aux (xs :: l) (x :: acc)

let concat l =
    concat_aux l []
