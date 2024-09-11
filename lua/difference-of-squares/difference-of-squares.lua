local function square_of_sum(n)
	local sum = 0
	for num = 1, n do
		sum = sum + num
	end
	return sum * sum
end

local function sum_of_squares(n)
	local sum = 0
	for num = 1, n do
		sum = sum + num * num
	end
	return sum
end

local function difference_of_squares(n)
	return square_of_sum(n) - sum_of_squares(n)
end

return { square_of_sum = square_of_sum, sum_of_squares = sum_of_squares, difference_of_squares = difference_of_squares }
