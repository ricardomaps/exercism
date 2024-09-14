local function aliquot_sum(n)
	local sum = 0
	for i = 1, math.floor(n / 2) do
		if n % i == 0 then
			sum = sum + i
		end
	end
	return sum
end

local function classify(n)
	local aliquot = aliquot_sum(n)
	if aliquot == n then
		return "perfect"
	elseif aliquot < n then
		return "deficient"
	else
		return "abundant"
	end
end

return { aliquot_sum = aliquot_sum, classify = classify }
