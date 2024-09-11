return function(array, target)
	local i, j = 1, #array
	while i <= j do
		local mid = math.floor((i + j) / 2)
		if array[mid] == target then
			return mid
		elseif array[mid] < target then
			i = mid + 1
		else
			j = mid - 1
		end
	end
	return -1
end
