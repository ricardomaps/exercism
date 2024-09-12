local function keep(xs, pred)
	local res = {}
	for _, elem in ipairs(xs) do
		if pred(elem) then
			table.insert(res, elem)
		end
	end
	return res
end

local function discard(xs, pred)
	return keep(xs, function(elem)
		return not pred(elem)
	end)
end

return { keep = keep, discard = discard }
