local function reduce(xs, value, f)
	for _, x in ipairs(xs) do
		value = f(x, value)
	end
	return value
end

local function map(xs, f)
	local res = {}
	for i, x in ipairs(xs) do
		res[i] = f(x)
	end
	return res
end

local function filter(xs, pred)
	local res = {}
	for _, x in ipairs(xs) do
		if pred(x) then
			table.insert(res, x)
		end
	end
	return res
end

return { map = map, reduce = reduce, filter = filter }
