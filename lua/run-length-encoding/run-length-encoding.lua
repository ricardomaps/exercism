return {
	encode = function(s)
		local split = function(p)
			local s = {}
			local splits = 0
			local last_split = 1
			for i = 1, #p do
				if p:sub(i + 1, i + 1) ~= p:sub(i, i) then
					splits = splits + 1
					s[splits] = p:sub(last_split, i)
					last_split = i + 1
				end
			end
			return s
		end
		local ans = ""
		for _, run in ipairs(split(s)) do
			if #run == 1 then
				ans = ans .. run
			else
				ans = ans .. tostring(#run) .. run:sub(1, 1)
			end
		end
		return ans
	end,
	decode = function(s)
		return s:gsub("(%d+)(.)", function(n, m)
			return string.rep(m, tonumber(n))
		end)
	end,
}
