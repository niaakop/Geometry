require_relative './line.rb'
require_relative './error.rb'
require_relative './point.rb'

class Geometry::LineSegment
  attr_reader :a, :b, :exist
  
  def initialize(a: nil, b: nil)
    if [a, b].are_kind_of?(Geometry::Point)
      if a != b
        @exist = true
        @a = a
        @b = b
      else
        @exist = false
        raise Geometry::DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def line
    Geometry::Line.new(var1: @a, var2: @b)
  end

  def length
    Math.sqrt(((@a.x - @b.x).abs ** 2) + ((@a.y - @b.y).abs ** 2))
  end

  def ==(ls)
    if ls.is_a?(Geometry::LineSegment)
      self.length == ls.length
    else
      false
    end
  end

  def !=(ls)
    !(self == ls)
  end

  def >(ls)
    if ls.is_a?(Geometry::LineSegment)
      self.length > ls.length
    else
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def <=(ls)
    !(self > ls)
  end

  def >=(ls)
    self > ls || self == ls
  end
 
  def <(ls)
    !(self >= ls)
  end
end