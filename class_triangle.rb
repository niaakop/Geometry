class Triangle
   attr_reader :defined
   def initialize(side_a = 0, side_b = 0, side_c = 0,
            ang_a = 0, ang_b = 0, ang_c = 0)
   @defined = ((side_a != 0) & (side_b != 0) & (side_c != 0)) | 
               ((side_a != 0) & (side_b != 0) & (ang_a != 0)) | 
               ((side_a != 0) & (ang_a != 0) & (ang_b != 0))
   end
end

a = Triangle.new(1, 2, 3)
b = Triangle.new(1, 2, 0, 4)
c = Triangle.new(0, 0, 3, 4)
puts a.defined # => true
puts b.defined # => true
puts c.defined # => false
