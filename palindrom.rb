	def palindrome(word)
		left_letter_index = 0
		length = word.length
		(length/2).times do
			right_letter_index = length - left_letter_index - 1
			if word[left_letter_index] != word[right_letter_index]
				return false
			end
			left_letter_index += 1
		end
		return true
	end

puts palindrome("abcddcba")