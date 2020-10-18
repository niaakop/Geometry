class MyClass
	CLASSNAME = "MyClass"
	@@inst_count = 0
	def initialize(inst_name)
		@name = inst_name
		puts "this is instance #{@name}"
		@@inst_count += 1
	end
	def inst_count 
		puts "there is #{@@inst_count} instances"
	end
	def classname?
		puts "it belongs to #{CLASSNAME} class"
	end
	def name?
		puts "#{@name}"
	end
end

inst_1 = MyClass.new("Firstborn")
inst_2 = MyClass.new("Second-rate")
inst_3 = MyClass.new("Third wheel")

inst_2.inst_count
inst_1.classname?
inst_3.name?