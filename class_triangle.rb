require './geometry_error'

class Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    @a = a
    @b = b
    @c = c
    if [@a, @b, @c].are_kind_of?(Point)
      if not_on_one_line?
        @exist = true
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise IncompatibleParamsError.new(self.class)
    end 
  end

  private

  def not_on_one_line?
    line = Line.new(var1: @a, var2: @b)
  rescue DegenerateShapeError => e
    if e.cls == Line
      !@c.is_on?(line)
    else
      raise e
    end
  end 
end

class Point
  attr_reader :exist, :x, :y

  def initialize(x, y)
      @x = x
      @y = y
    if [x, y].are_kind_of?(Integer, Float)
      @exist = true
    else
      @exist = false
      raise IncompatibleParamsError.new(self.class)
    end
  end

  def is_on?(line)
    if line.is_a?(Line)
      @y * line.a + @x * line.b + line.c == 0
    else
      false
    end  
  end

  def ==(point)
    if point.is_a?(Point)
      @x == point.x && @y == point.y
    else
      false
    end
  end

  def !=(point)
      !(self == point)
  end
end

class Line
  attr_reader :a, :b, :c, :exist

  def initialize(var1: nil, var2: nil, var3: nil) #var1 is 1st point or a, var2 is 2nd point or b, var3 is c 
    if [var1, var2].are_kind_of?(Point) 
      if var1 != var2 
        @exist = true
        @a = var2.x - var1.x 
        @b = var1.y - var2.y 
        @c = var1.x * var2.y - var2.x * var1.y
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    elsif [var1, var2, var3].are_kind_of?(Integer, Float)
      if !(var1 == 0 && var2 == 0)
        @exist = true
        @a = var1
        @b = var2
        @c = var3
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise IncompatibleParamsError.new(self.class)
    end 
  end
end

class Array
  def are_kind_of?(*cls)
    self.all? { |i| cls.any? { |c| i.kind_of?(c) } }
  end
end

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