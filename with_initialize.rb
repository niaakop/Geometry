class MyClass
	CLASSNAME = "MyClass"
	@@inst_count = 0
	attr_reader :name, :id 
	attr_writer :val
	def initialize(name)
		@name = name
		puts "this is instance #{@name}"
		@id = "#{@@inst_count}: <<#{@name}>>"
		@@inst_count += 1
	end
	def inst_count 
		puts "there is #{@@inst_count} instances"
	end
	def classname?
		puts "it belongs to #{CLASSNAME} class"
	end
	def val?
		puts @val
	end
end

inst_1 = MyClass.new("Firstborn")
inst_2 = MyClass.new("Second-rate")
inst_3 = MyClass.new("Third wheel")

inst_2.inst_count
inst_1.classname?

inst_3.val = 14
#puts inst_3.val 
puts inst_1.name
#inst_1.name = "New Name"
inst_2.val = 124
inst_2.val? 

puts inst_1.id # => 0: <<Firstborn>>
puts inst_3.id # => 2: <<Third wheel>>
