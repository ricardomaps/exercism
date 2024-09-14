LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:push(value)
	local node = { value = value, prev = self.right.prev, next = self.right }
	self.right.prev.next = node
	self.right.prev = node
end

function LinkedList:unshift(value)
	local node = { value = value, next = self.left.next, prev = self.left }
	self.left.next.prev = node
	self.left.next = node
end

function LinkedList:delete(value)
	local node = self.left
	while node ~= self.right do
		node = node.next
		if node.value == value then
			node.prev.next = node.next
			node.next.prev = node.prev
		end
	end
end

function LinkedList:pop()
	local v = self.right.prev.value
	self.right.prev = self.right.prev.prev
	self.right.prev.next = self.right
	return v
end

function LinkedList:shift()
	local v = self.left.next.value
	self.left.next = self.left.next.next
	self.left.next.prev = self.left
	return v
end

function LinkedList:count()
	local count = 0
	local node = self.left.next
	while node ~= self.right do
		node = node.next
		count = count + 1
	end
	return count
end

return function()
	local left, right = {}, {}
	left.next, right.prev = right, left
	return setmetatable({ left = left, right = right }, LinkedList)
end
