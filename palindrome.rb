class String
	def is_palindrome
		i = 0
		length = self.length
		(length/2).times do |i|
			if self[i] != self[length - i - 1]
				return false
			end
		end
		true
	end
end
puts "abcba".is_palindrome