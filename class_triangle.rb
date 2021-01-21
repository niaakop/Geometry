require './my_error'

class Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    if a.is_a?(Point) && b.is_a?(Point) && c.is_a?(Point) && 
      not_on_one_line?(a: a, b: b, c: c)
      @exist = true
      @a = a
      @b = b
      @c = c
    elsif !(a.is_a?(Point) && b.is_a?(Point) && c.is_a?(Point))
      exist = false
      raise MyError.new "wrong parameters type of triangle initialize"
    elsif !(not_on_one_line?(a: a, b: b, c: c))
      exist = false
      raise MyError.new "triangle with such parameters cannot exist"
    end 
  end

  private

  def not_on_one_line?(a: nil, b: nil, c: nil)
    !c.is_on?(Line.new(var1: a, var2: b))
  rescue MyError
    false
  end 

end

class Point
  attr_reader :exist, :x, :y

  def initialize(x, y)
    if (x.is_a?(Integer) || x.is_a?(Float)) && 
            (y.is_a?(Integer) || y.is_a?(Float))
      @x = x
      @y = y
    elsif !((x.is_a?(Integer) || x.is_a?(Float)) && 
            (y.is_a?(Integer) || y.is_a?(Float)))
      @exist = false
      raise MyError.new "wrong parameters type of point initialize"
    end
  end

  def is_on?(line)
    if line.exist
      @y * line.a + @x * line.b + line.c == 0
    else
      false
    end  
  end

  def ==(point)
    @x == point.x && @y == point.y
  end

  def !=(point)
    @x != point.x || @y != point.y
  end
end

class Line
  attr_reader :a, :b, :c, :exist

  def initialize(var1: nil, var2: nil, var3: nil) #var1 is 1st point or a, var2 is 2nd point or b, var3 is c 
    if var1.is_a?(Point) && var2.is_a?(Point) && var1 != var2 
      @exist = true
      @a = var2.x - var1.x 
      @b = var1.y - var2.y 
      @c = var1.x * var2.y - var2.x * var1.y
    elsif (var1.is_a?(Integer) || var1.is_a?(Float)) && 
            (var2.is_a?(Integer) || var2.is_a?(Float)) &&
            (var3.is_a?(Integer) || var3.is_a?(Float)) && 
            (!(var1 == 0 && var2 == 0))
      @exist = true
      @a = var1
      @b = var2
      @c = var3
    elsif !(var1.is_a?(Point) && var2.is_a?(Point)) && 
            !( 
            (var1.is_a?(Integer) || var1.is_a?(Float)) && 
            (var2.is_a?(Integer) || var2.is_a?(Float)) &&
            (var3.is_a?(Integer) || var3.is_a?(Float)) 
            )
      @exist = false
      raise MyError.new "wrong parameters type of line initialize"
    elsif var1 == var2
      @exist = false
      raise MyError.new "line with such parameters cannot exist" 
    end 
  end
end

first_point = Point.new(2, 4)
second_point = Point.new(3, 6)
first_line = Line.new(var1: first_point, var2: second_point)

third_point = Point.new(4, 8)
puts third_point.is_on?(first_line) #=> true

second_line = Line.new(var1: 0, var2: 2, var3: 0.5)
fourth_point = Point.new(-0.25, 30)
puts fourth_point.is_on?(second_line) #=> true

#####
a = Point.new(26, 6)
b = Point.new(27, 6)
c = Point.new(14, 7)
abc = Triangle.new(a: a, b: b, c: c)
puts abc.exist #=>true
# p abc.a, abc.b, abc.c