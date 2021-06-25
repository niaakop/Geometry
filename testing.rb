require_relative "./geometry.rb"

module Geometry
  first_point = Point.new(2, 4)
  second_point = Point.new(3, 6)
  first_line = Line.new(var1: first_point, var2: second_point)

  third_point = Point.new(4, 8)
  puts third_point.is_on?(first_line) # true

  second_line = Line.new(var1: 0, var2: 2, var3: 0.5)
  fourth_point = Point.new(-0.25, 30)
  puts fourth_point.is_on?(second_line) # true

  a = Point.new(26, 6)
  b = Point.new(27, 6)
  c = Point.new(14, 7)
  abc = Triangle.new(a, b, c)
  puts abc.exist # true

  puts LineSegment.new(Point.new(0, 0), Point.new(-300, 0)).length
  ls_1 = LineSegment.new(Point.new(0, 1), Point.new(-300, 0))
  ls_2 = LineSegment.new(Point.new(0, 1), Point.new(10, 0))
  puts ls_1 != ls_2 # true

  puts abc.perimeter
  first_line.slope_intercept_form
  p first_line.m_si, first_line.b_si

  p first_line.intersection_point?(second_line) # @x=-0.25, @y=-0.25, @exist=true>
  p first_line.intersection_point?(Line.new(var1: Point.new(3, 4), var2: Point.new(4, 6))) # false
end
