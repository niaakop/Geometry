require_relative './array.rb'
require_relative './error.rb'
require_relative './line.rb'
require_relative './line_segment'

class Geometry::Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    @a = a
    @b = b
    @c = c
    if [@a, @b, @c].are_kind_of?(Geometry::Point)
      if not_on_one_line?
        @exist = true
      else
        @exist = false
        raise Geometry::DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def perimeter
    @ab = Geometry::LineSegment.new(@a, @b)
    @bc = Geometry::LineSegment.new(@b, @c)
    @ca = Geometry::LineSegment.new(@c, @a)
    @ab.length + @bc.length + @ca.length
  end

  private

  def not_on_one_line?
    line = Geometry::Line.new(var1: @a, var2: @b)
  rescue DegenerateShapeError => e
    if e.cls == Line
      !@c.is_on?(line)
    else
      raise e
    end
  end
end
