local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
	local total, digits = 0, tostring(number)
	for c in string.gmatch(digits, ".") do
		total = total + tonumber(c) ^ #digits
	end
	return total == number
end

return ArmstrongNumbers
