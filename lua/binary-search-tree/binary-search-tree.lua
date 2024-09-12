local BinarySearchTree = {}

function BinarySearchTree:new(value)
	return setmetatable({ value = value }, { __index = self })
end

function BinarySearchTree:insert(new_value)
	local child = new_value > self.value and "right" or "left"
	if self[child] then
		self[child]:insert(new_value)
	else
		self[child] = BinarySearchTree:new(new_value)
	end
end

function BinarySearchTree:from_list(list)
	assert(#list > 0, "cannot create tree from empty list")
	local root = BinarySearchTree:new(list[1])
	for i = 2, #list do
		root:insert(list[i])
	end
	return root
end

function BinarySearchTree:values()
	return coroutine.wrap(function()
		if self.left then
			for v in self.left:values() do
				coroutine.yield(v)
			end
		end
		coroutine.yield(self.value)
		if self.right then
			for v in self.right:values() do
				coroutine.yield(v)
			end
		end
	end)
end

return BinarySearchTree
