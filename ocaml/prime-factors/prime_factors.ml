open Int64
let factors_of (num : int64) = 
    let rec aux (n : int64) (factor : int64) acc =
        if n = 1L then List.rev acc
        else
        if rem n factor = 0L
        then aux (div n factor) factor (factor::acc)
        else aux n (add factor 1L) acc
    in aux num 2L []
