class Triangle
   attr_reader :defined
   def initialize(side_a:, side_b:, side_c:, ang_a:, ang_b:, ang_c:)
   @defined = ((side_a != nil) & (side_b != nil) & (side_c != nil)) | 
               ((side_a != nil) & (side_b != nil) & (ang_a != nil)) | 
               ((side_a != nil) & (ang_a != nil) & (ang_b != nil))
   end
end

#parameters = {side_a: nil, side_b: nil, side_c: nil,
 #           ang_a: nil, ang_b: nil, ang_c: nil}
a = Triangle.new({side_a: 14, side_b: 51, side_c: 543})
#b = Triangle.new()
#c = Triangle.new()
puts a.defined # => true
#puts b.defined # => true
#puts c.defined # => false
