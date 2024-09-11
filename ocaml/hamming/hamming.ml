open Base

type nucleotide = A | C | G | T

let validate_not_empty strand1 strand2 = 
    match (strand1, strand2) with
    | ([], []) -> Ok()
    | ([], _) -> Error "left strand must not be empty"
    | (_, []) -> Error "right strand must not be empty"
    | _ -> Ok()

let nucleotide_equal = function
    | (A, A) | (C, C) | (G, G) | (T, T) -> false
    | _ -> true

let hamming_aux zipped = 
    List.count zipped ~f:(fun zip_nucl -> nucleotide_equal zip_nucl)

let hamming_distance (strand1 : nucleotide list) (strand2 : nucleotide list) =
    match validate_not_empty strand1 strand2 with
    | Error(message) -> Error(message)
    | Ok() -> match List.zip strand1 strand2 with
              | Unequal_lengths -> Error("left and right strands must be of equal length")
              | Ok(zipped) -> Ok(hamming_aux zipped)
    
  
