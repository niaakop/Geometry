require_relative './error.rb'
require_relative './line.rb'
require_relative './line_segment.rb'
require_relative './triangle.rb'
require_relative './array.rb'

class Geometry::Point
  attr_reader :exist, :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    if [x, y].are_kind_of?(Integer, Float)
      @exist = true
    @x = x.to_f
    @y = y.to_f
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def contained?(shape)
    if [shape].are_kind_of?(Geometry::Line, Geometry::LineSegment, Geometry::Triangle) 
      shape.contains?(self)
    else
      raise ArgumentError.new("point content in #{shape.class} class is not possible")
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
