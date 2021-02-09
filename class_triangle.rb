require './geometry_error'

class Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    @a = a
    @b = b
    @c = c
    if @a.is_a?(Point) && @b.is_a?(Point) && @c.is_a?(Point) && 
      not_on_one_line?
      @exist = true
    elsif !(@a.is_a?(Point) && @b.is_a?(Point) && @c.is_a?(Point))
      exist = false
      raise IncompatibleParamsError.new(
            "wrong parameters type of triangle initialize", Triangle)
    elsif !(not_on_one_line?)
      exist = false
      raise DegenerateShapeError.new(
            "triangle with such parameters cannot exist", Triangle)
    end 
  end

  private

  def not_on_one_line?
    !@c.is_on?(Line.new(var1: @a, var2: @b))
  rescue GeometryError
    false
  end 

end

class Point
  attr_reader :exist, :x, :y

  def initialize(x, y)
      @x = x
      @y = y
    if are_numbers?(x, y)
      @exist = true
    else
      @exist = false
      raise IncompatibleParamsError.new(
            "wrong parameters type of point initialize", Point)
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
  rescue GeometryError
    false
  end

  def !=(point)
    @x != point.x || @y != point.y
  rescue GeometryError
    false
  end
end

class Line
  attr_reader :a, :b, :c, :exist

  def initialize(var1: nil, var2: nil, var3: nil) #var1 is 1st point or a, var2 is 2nd point or b, var3 is c 
    @var1 = var1
    @var2 = var2
    @var3 = var3
    if @var1.is_a?(Point) && @var2.is_a?(Point) && @var1 != @var2 
      @exist = true
      @a = @var2.x - @var1.x 
      @b = @var1.y - @var2.y 
      @c = @var1.x * @var2.y - @var2.x * @var1.y
    elsif are_numbers?(@var1, @var2, @var3) && !(@var1 == 0 && @var2 == 0)
      @exist = true
      @a = @var1
      @b = @var2
      @c = @var3
    elsif !(@var1.is_a?(Point) && @var2.is_a?(Point)) && 
                        !are_numbers?(@var1, @var2, @var3)
      @exist = false
      raise IncompatibleParamsError.new(
            "wrong parameters type of line initialize", Line)
    elsif @var1 == @var2 || (@var1 == 0 && @var2 == 0)
      @exist = false
      raise DegenerateShapeError.new(
            "line with such parameters cannot exist", Line)
    end 
  end
end

def are_numbers?(*args)
  i = 0
  until i == args.length
    return false if !(args[i].is_a?(Integer) || args[i].is_a?(Float))
    i += 1
  end     
  true 
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