def palindrome(word)
	left_letter_index = 0
	length = word.length
	(length/2).times do |left_letter_index|
		if word[left_letter_index] != word[length - left_letter_index - 1]
			return false
		end
		left_letter_index += 1
	end
	return true
end

puts palindrome("abcddba")