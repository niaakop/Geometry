require_relative "./geometry.rb"

module Geometry
  p1 = Point.new(2, 4)
  p2 = Point.new(3, 6)
  l1 = Line.new(var1: p1, var2: p2)

  p3 = Point.new(4, 8)
  p p3.contained?(l1) # true

  l2 = Line.new(var1: 0, var2: 2, var3: 0.5)
  fourth_point = Point.new(30, -0.25)
  p fourth_point.contained?(l2) # true

  a = Point.new(26, 6)
  b = Point.new(27, 6)
  c = Point.new(14, 7)
  abc1 = Triangle.new(a, b, c)
  p abc1.exist # true

  p LineSegment.new(Point.new(0, 0), Point.new(-300, 0)).length # 300.0
  ls1 = LineSegment.new(Point.new(0, 1), Point.new(-300, 0))
  ls2 = LineSegment.new(Point.new(0, 1), Point.new(10, 0))
  p ls1 != ls2 # true

  p abc1.perimeter # 26.079999389197596
  l1.slope_intercept_form 
  p l1.k_si, l1.b_si # 2.0 -0.0

  p l1.intersection_point?(l2) # @x=-0.125, @y=-0.25, @exist=true>
  p l1.intersection_point?(Line.new(var1: Point.new(3, 4), var2: Point.new(4, 6))) # false
  p LineSegment.new(Point.new(2, 7), Point.new(3, 9)).intersection_point?(LineSegment.new(Point.new(5, 4), Point.new(4, 6))) # false

  p "ls1.x1x2, ls1.y1y2 #{ls1.x1x2} #{ls1.y1y2}" # -299.99999999999994...0.0 
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

  # private methods
  # p abc1.opposite(abc1.c) # #<Geometry::LineSegment:0x0000561c930de7c8 @exist=true, @a=#<Geometry::Point:0x0000561c930ded18 @x=26.0, @y=6.0, @exist=true>, @b=#<Geometry::Point:0x0000561c930dec28 @x=27.0, @y=6.0, @exist=true>>

  abc4 = Triangle.new(Point.new(27, 6), Point.new(26, 6.0001), Point.new(14, 7))
  # private methods
  # p abc3.sides_intersection?(abc4) # true
  # p abc3.sides_intersection?(abc2) # false
  # p abc1.contains_any_vertices?(abc4) #true 
  # p abc3.contains_any_vertices?(abc1) #false
  p "tr intersection"
  tr1 = Triangle.new(Point.new(1, 1), Point.new(2, 1), Point.new(2, 3))
  tr2 = Triangle.new(Point.new(3, 2), Point.new(1, 3), Point.new(3, 4))
  p tr1.intersect?(tr2) # true
  p tr2.intersect?(tr1) # true
  tr3 = Triangle.new(Point.new(1, 1), Point.new(4, 1), Point.new(3, 5))
  tr4 = Triangle.new(Point.new(1, 1), Point.new(4, 1), Point.new(3, 3))
  p tr3.intersect?(tr4) # true
  p tr4.intersect?(tr3) # true
  tr5 = Triangle.new(Point.new(1, 1), Point.new(4, 1), Point.new(1, 4))
  tr6 = Triangle.new(Point.new(1, 1), Point.new(3, 1), Point.new(1, 3))
  p tr5.intersect?(tr6) # true
  p tr6.intersect?(tr5) # true
  tr7 = Triangle.new(Point.new(1, 1), Point.new(5, 1), Point.new(1, 4))
  tr8 = Triangle.new(Point.new(1, 1), Point.new(5, 1), Point.new(1, 3))
  p tr7.intersect?(tr8) # true
  p tr8.intersect?(tr7) # true
  tr9 = Triangle.new(Point.new(1, 4), Point.new(4, 1), Point.new(4, 4))
  tr10 = Triangle.new(Point.new(1, 1), Point.new(4, 1), Point.new(1, 4))
  p tr9.intersect?(tr10) # false 
  p tr10.intersect?(tr9) # false
  tr11 = Triangle.new(Point.new(2, 4), Point.new(4, 1), Point.new(4, 4))
  tr12 = Triangle.new(Point.new(1, 1), Point.new(3, 1), Point.new(1, 4))
  p tr11.intersect?(tr12) # false 
  p tr12.intersect?(tr11) # false
  tr13 = Triangle.new(Point.new(1, 1), Point.new(5, 2), Point.new(4, 4))
  tr14 = Triangle.new(Point.new(4, 1), Point.new(1, 3), Point.new(3, 4))
  p tr13.intersect?(tr14) # true
  p tr14.intersect?(tr13) # true
  tr15 = Triangle.new(Point.new(3, 2), Point.new(4, 4), Point.new(3, 4))
  tr16 = Triangle.new(Point.new(1, 1), Point.new(4, 1), Point.new(1, 4))
  p tr15.intersect?(tr16) # false 
  p tr16.intersect?(tr15) # false
  tr17 = Triangle.new(Point.new(4, 1), Point.new(2, 3), Point.new(4, 3))
  tr18 = Triangle.new(Point.new(1, 2), Point.new(1, 4), Point.new(3, 2))
  p tr17.intersect?(tr18) # false 
  p tr18.intersect?(tr17) # false
  tr19 = Triangle.new(Point.new(1, 1), Point.new(3, 1), Point.new(2, 4))
  tr20 = Triangle.new(Point.new(1, 1), Point.new(3, 1), Point.new(2, 4))
  p tr19.intersect?(tr20) # true
  p tr20.intersect?(tr19) # true
end
