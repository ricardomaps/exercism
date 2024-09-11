open Base

let transform list = 
    let letter_to_tuple points letter = (Char.lowercase letter, points) in 
    let mapper (points, letters) = List.map letters (letter_to_tuple points) in
    List.concat_map list mapper
    |> List.sort ~compare:(fun (letter1, _) (letter2, _) -> Char.compare letter1 letter2)