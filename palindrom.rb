module MyModule
	def palindrome(s)
		left_letter = -1
		right_letter = s.length
		same_letter = false
		(s.length/2).times do
			left_letter += 1
			right_letter -= 1
			same_letter = s[left_letter] == s[right_letter]
			if not same_letter 
				break
			end
		end
		return same_letter
	end
end	

class MyClass	
	include MyModule
	def my_method
		puts palindrome("abcdcba")
	end
end

my_ob = MyClass.new
my_ob.my_method