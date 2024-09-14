return function(n)
	local ans = ""
	if n % 3 == 0 then
		ans = ans .. "Pling"
	end
	if n % 5 == 0 then
		ans = ans .. "Plang"
	end
	if n % 7 == 0 then
		ans = ans .. "Plong"
	end
	if #ans == 0 then
		ans = tostring(n)
	end
	return ans
end
