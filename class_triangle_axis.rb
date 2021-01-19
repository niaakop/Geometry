class MyError < StandardError
end

class Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    @a = a
    @b = b
    @c = c

    @exist = not_on_one_line? 
  end

  private

  def not_on_one_line? 
    line = Line.new(var1: @a, var2: @b)
    !@c.is_on?(line)
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
    else
      raise MyError.new "Wrong parameters of point initialize"
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
      @a = var2.x - var1.x 
      @b = var1.y - var2.y 
      @c = var1.x * var2.y - var2.x * var1.y
      @exist = true
    elsif (var1.is_a?(Integer) || var1.is_a?(Float)) && 
            (var2.is_a?(Integer) || var2.is_a?(Float)) &&
            (var3.is_a?(Integer) || var3.is_a?(Float)) && 
            (!(var1 == 0 && var2 == 0))
      @a = var1
      @b = var2
      @c = var3
      @exist = true
    else
      @exist = false
      raise MyError.new "Wrong parameters of line initialize"
    end 
  end
end

first_point = Point.new(2, 4)
second_point = Point.new(3, 6)
my_first_line = Line.new(var1: first_point, var2: second_point)

third_point = Point.new(4, 8)
puts third_point.is_on?(my_first_line) #=> true

my_second_line = Line.new(var1: 0, var2: 2, var3: 0.5)
fourth_point = Point.new(-0.25, 30)
puts fourth_point.is_on?(my_second_line) #=> true

#####
a = Point.new(26, 6)
b = Point.new(25, 6)
c = Point.new(14, 7)
abc = Triangle.new(a: a, b: b, c: c)
puts abc.exist #=>true
#efg = Triangle.new(a: Point.new(1,1), b: Point.new(4,'s'), c: Point.new(1,13))