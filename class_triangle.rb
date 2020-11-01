class Triangle
   attr_reader :defined
   def initialize(side_a: nil, side_b: nil, side_c: nil, ang_a: nil, ang_b: nil, ang_c: nil)
   @defined = ((side_a != nil) & (side_b != nil) & (side_c != nil)) | 
               ((side_a != nil) & (side_b != nil) & (ang_a != nil)) | 
               ((side_a != nil) & (ang_a != nil) & (ang_b != nil))
   end
end

a = Triangle.new(side_a: 14, side_b: 51, side_c: 543)

puts a.defined # => true
