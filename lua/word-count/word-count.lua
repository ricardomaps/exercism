local function word_count(s)
	local words = {}
	for w in s:lower():gmatch("[%w']+") do
		if w:find("%b''") then
			w = w:sub(2, #w - 1)
		end
		words[w] = (words[w] or 0) + 1
	end
	return words
end

return { word_count = word_count }
