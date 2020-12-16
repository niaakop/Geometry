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
=end
a = 5
b = 6
puts a || begin 