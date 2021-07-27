require_relative "./geometry.rb"

module Geometry
  p1 = Point.new(2, 4)
  p2 = Point.new(3, 6)
  l1 = Line.new(var1: p1, var2: p2)

  p3 = Point.new(4, 8)
  puts p3.contained?(l1) # true

  l2 = Line.new(var1: 0, var2: 2, var3: 0.5)
  fourth_point = Point.new(30, -0.25)
  puts fourth_point.contained?(l2) # true

  a = Point.new(26, 6)
  b = Point.new(27, 6)
  c = Point.new(14, 7)
  abc1 = Triangle.new(a, b, c)
  puts abc1.exist # true

  puts LineSegment.new(Point.new(0, 0), Point.new(-300, 0)).length # 300.0
  ls1 = LineSegment.new(Point.new(0, 1), Point.new(-300, 0))
  ls2 = LineSegment.new(Point.new(0, 1), Point.new(10, 0))
  puts ls1 != ls2 # true

  puts abc1.perimeter
  l1.slope_intercept_form # 26.079999389197596
  p l1.k_si, l1.b_si # 2.0 -0.0

  p l1.intersection_point?(l2) # @x=-0.125, @y=-0.25, @exist=true>
  p l1.intersection_point?(Line.new(var1: Point.new(3, 4), var2: Point.new(4, 6))) # false
  p LineSegment.new(Point.new(2, 7), Point.new(3, 9)).intersection_point?(LineSegment.new(Point.new(5, 4), Point.new(4, 6))) # false

  p ls1.x1x2, ls1.y1y2 # -299.99999999999994...0.0 
                         # 5.0e-324...1.0
  p ls1.intersection_point?(ls2) # false
  p ls1.intersection_point?(LineSegment.new(Point.new(0, -1), Point.new(-10, 5))) # #<Geometry::Point:0x00005651606e1498 @x=-3.3149171270718236, @y=0.988950276243094, @exist=true> 

  p ls2.intersection_point?(l1) # #<Geometry::Point:0x000055736ce1c168 @x=0.47619047619047616, @y=0.9523809523809523, @exist=true>

  abc2 = Triangle.new(p1, p2, Point.new(4, 4))
  p abc2.contains?(Point.new(3, 5)) # true
  p abc2.contains?(p1) # false

  p abc1 == abc2 # false
  abc3 = Triangle.new(Point.new(27, 6), Point.new(26, 6), Point.new(14, 7))
  p abc1 == abc3 # true

  # private method
  # p abc1.opposite(abc1.c) # #<Geometry::LineSegment:0x0000561c930de7c8 @exist=true, @a=#<Geometry::Point:0x0000561c930ded18 @x=26.0, @y=6.0, @exist=true>, @b=#<Geometry::Point:0x0000561c930dec28 @x=27.0, @y=6.0, @exist=true>>
end
