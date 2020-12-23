=begin
def defined(*args)
    args.each do |n| 
        unless n.is_a? Integer
            return false
        end
    end
    true
end

puts defined(1, 5, 8, "a")

a = 5
b = 6
puts a || begin 


class MyClass
    def initialize
        "initialize"
    end
end

a = MyClass.new
b = MyClass.new
c = 0
puts (b && a).is_a?(MyClass)
=end

def blabla(a: nil, b: nil, c: nil)
    puts a, b, c
end

blabla(a: 4, c: 5, b: 15)
