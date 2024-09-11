open Base

let count_nucleotide s n =
    if Char.(=) n 'X' then Error 'X' else
    let rec aux i count =
        if i >= String.length s then Ok count else
        let c = s.[i] in
        match c with
        |'A'|'G'|'T'|'C' -> if Char.(=) c n then aux (i+1) (count+1) else aux (i+1) count
        | x -> Error x
    in aux 0 0

let count_nucleotides s =
  let rec aux i count_A count_C count_G count_T =
      if i >= String.length s then Ok (Map.of_alist_exn (module Char) (List.filter ~f:(fun (_, c) -> c > 0) [('G', count_G); ('C', count_C); ('A', count_A); ('T', count_T)])) else
      match s.[i] with
      |'A' -> aux (i+1) (count_A+1) count_C count_G count_T
      |'T' -> aux (i+1) count_A count_C count_G (count_T+1)
      |'C' -> aux (i+1) count_A (count_C+1) count_G count_T
      |'G' -> aux (i+1) count_A count_C (count_G+1) count_T
      | x -> Error x
  in aux 0 0 0 0 0
