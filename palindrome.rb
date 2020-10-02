class String
	def self.is_palindrome(string)
		i = 0
		length = string.length
		(length/2).times do |i|
			if string[i] != string[length - i - 1]
				return false
			end
		end
		true
	end
end
