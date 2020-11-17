
def defined(*args)
    args.each do |n| 
        if not n.is_a? Integer
            return false
        end
    end
    true
end

puts defined(1, 5, 8, "a")
