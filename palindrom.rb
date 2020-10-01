module MyModule
	def pal(s)
		x = -1
		y = s.length
		b = false
		(s.length/2).times do
			x += 1
			y -= 1
			puts x
			puts y
			b = s[x] == s[y]
			puts s[x]
			puts s[y]
			puts b
			if b == false
				break
			end
		end
		return b
	end
end	

class MyClass	
	include MyModule
	def my_method
		puts pal("abdcba")
	end
end

my_ob = MyClass.new
my_ob.my_method