local Set = {}

function new(...)
	local t = {}
	for _, elem in ipairs(arg) do
		t[elem] = true
	end
	setmetatable(t, { __index = Set })
	return t
end

function Set:is_empty()
	return next(self) == nil
end

function Set:contains(elem)
	return self[elem] == true
end

function Set:is_subset(set)
	for elem in pairs(self) do
		if not set[elem] then
			return false
		end
	end
	return true
end

function Set:is_disjoint(set)
	for elem in pairs(self) do
		if set[elem] then
			return false
		end
	end
	return true
end

function Set:equals(set)
	return self:is_subset(set) and set:is_subset(self)
end

function Set:add(elem)
	self[elem] = true
end

function Set:intersection(set)
	local res = new()
	for elem in pairs(self) do
		if set[elem] then
			res[elem] = true
		end
	end
	return res
end

function Set:difference(set)
	local res = new()
	for elem in pairs(self) do
		if not set[elem] then
			res[elem] = true
		end
	end
	return res
end

function Set:union(set)
	local res = new()
	for elem in pairs(self) do
		res[elem] = true
	end
	for elem in pairs(set) do
		res[elem] = true
	end
	return res
end

return new
