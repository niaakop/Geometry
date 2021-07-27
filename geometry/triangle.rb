require_relative './array.rb'
require_relative './error.rb'
require_relative './line.rb'
require_relative './line_segment'

class Geometry::Triangle
  attr_reader :exist, :a, :b, :c, :ab, :bc, :ca

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    if [@a, @b, @c].are_kind_of?(Geometry::Point)
      if not_on_one_line?
        @ab = Geometry::LineSegment.new(@a, @b)
        @bc = Geometry::LineSegment.new(@b, @c)
        @ca = Geometry::LineSegment.new(@c, @a)
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
    @ab.length + @bc.length + @ca.length
  end

  def contains?(point)
    if point == @a
      return false
    end
    ap = Geometry::Line.new(var1: @a, var2: point)
    d = ap.intersection_point?(@bc)
    if d 
      ad = Geometry::LineSegment.new(@a, d)
      ad.contains?(point)
    else
      false
    end
  end
    
  def ==(triangle)
    if triangle.is_a?(Geometry::Triangle)
      a = triangle.a
      b = triangle.b
      c = triangle.c
      2.times do 
        3.times do
          if @a == a && @b == b && @c == c
            return true
          end
          i = a
          a = b
          b = c
          c = i
        end
        i = a
        a = b
        b = i
      end
    end
    false
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

  def opposite(s)
    if s.equal?(@a)
      @bc
    elsif s.equal?(@b)
      @ca
    elsif s.equal?(@c)
      @ab
    elsif s.equal?(@ab)
      @c
    elsif s.equal?(@bc)
      @a
    elsif s.equal?(@ca)
      @b 
    else
      raise ArgumentError.new("incorrect parameter entered")
    end
  end
end
