open Base

module Int_map = Map.M(Int)
type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add student grade school =
    Map.add_multi school ~key:grade ~data:student

let sorted school = Map.map school ~f:(fun list -> List.sort ~compare:String.compare list) 

let grade grade_num school = Map.find_multi school grade_num |> List.sort ~compare:String.compare

let roster school =  school |> sorted |> Map.data |> List.concat
    
