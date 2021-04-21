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
  abc = Triangle.new(a: a, b: b, c: c)
  puts abc.exist # true

  puts LineSegment.new(a: Point.new(0, 0), b: Point.new(-300, 0)).length
  ls_1 = LineSegment.new(a: Point.new(0, 1), b: Point.new(-300, 0))
  ls_2 = LineSegment.new(a: Point.new(0, 1), b: Point.new(10, 0))
  puts ls_1 != ls_2 # true
end
