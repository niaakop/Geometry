require_relative './error.rb'
require_relative './line.rb'

class Geometry::Point
  attr_reader :exist, :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    if [x, y].are_kind_of?(Integer, Float)
      @exist = true
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def is_on?(line)
    if line.is_a?(Geometry::Line)
      @y * line.a + @x * line.b + line.c == 0
    else
      false
    end
  end

  def ==(point)
    if point.is_a?(Geometry::Point)
      @x == point.x && @y == point.y
    else
      false
    end
  end

  def !=(point)
    !(self == point)
  end
end
