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

  def intersection_point?(shape)
    if shape.is_a?(Geometry::LineSegment)
      ls = shape    
      lines_int_pnt = line.intersection_point?(ls.line)
      if lines_int_pnt && contains?(lines_int_pnt) && ls.contains?(lines_int_pnt)
        lines_int_pnt
      else
        false
      end
    elsif shape.is_a?(Geometry::Line)
      ln = shape
      lines_int_pnt = ln.intersection_point?(line)
      if lines_int_pnt && contains?(lines_int_pnt)
        lines_int_pnt
      else
        false
      end
    else
      raise ArgumentError.new("intersection of a line segment with an instance of #{shape.class} class is not possible")
    end
  end

  def contains?(point)
    if !point.is_a?(Geometry::Point)
      raise ArgumentError.new("instance content of #{point.class} class in line segment is not possible")
    end
    if line.contains?(point)
      x1x2.include?(point.x)
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
