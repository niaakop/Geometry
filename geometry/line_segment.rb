require_relative './line.rb'
require_relative './error.rb'
require_relative './point.rb'

class Geometry::LineSegment
  attr_reader :a, :b, :x1x2, :y1y2, :exist
  
  def initialize(a, b)
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
      raise ArgumentError.new("comparison of LineSegment with another class failed")
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

  def intersection_point?(ls)
    if !ls.is_a?(Geometry::LineSegment)
      raise ArgumentError.new("intersection of a line segment with an instance of another class is not possible")
    end
    lines_int_pnt = self.line.intersection_point?(ls.line)
    x1x2.include?(lines_int_pnt.x) 
    if lines_int_pnt.is_a?(Geometry::Point) && 
        x1x2.include?(lines_int_pnt.x) && ls.x1x2.include?(lines_int_pnt.x)
      lines_int_pnt
    else
      false
    end
  end

  def x1x2
  # open set. x1 < x1x2 < x2
    ([@a.x, @b.x].min.next_float...[@a.x, @b.x].max)
  end

  def y1y2
  # open set. y1 < y1y2 < y2
    ([@a.y, @b.y].min.next_float...[@a.y, @b.y].max)
  end
end
