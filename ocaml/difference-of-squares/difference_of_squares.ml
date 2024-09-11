let rec sum_of_range n acc =
    if n < 1 then acc else sum_of_range (n-1) (acc+n)

let square_of_sum n = 
    let sum = sum_of_range n 0 in
    sum * sum

let rec sum_of_squares_aux n acc = 
    if n < 1 then acc else sum_of_squares_aux (n-1) (acc+n*n)

let sum_of_squares n =
    sum_of_squares_aux n 0 

let difference_of_squares n =
    let sum_squares = sum_of_squares n in
    let square_sum = square_of_sum n in
    square_sum - sum_squares
