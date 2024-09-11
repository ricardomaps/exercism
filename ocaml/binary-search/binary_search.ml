let find songs song =
    let rec bin_search lo hi =
      if lo > hi then Error "value not in array"
      else
      let mid = (lo + hi)/2 in
      match songs.(mid) with
      | _ when s == song -> Ok mid
      | _ when s < song -> bin_search (mid+1) hi
      | _ -> bin_search lo (mid-1) in
    bin_search 0 ((Array.length songs)-1)
