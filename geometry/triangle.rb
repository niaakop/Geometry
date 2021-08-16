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

  def intersect?(triangle)
    if sides_intersect?(triangle)
      true
    elsif contains_any_vertice?(triangle) || triangle.contains_any_vertice?(self) 
      true
    elsif side_and_vert_it_contains(triangle) || triangle.side_and_vert_it_contains(self)
      tr1 = self
      tr2 = triangle
      if tr2.side_and_vert_it_contains(tr1) # tr1 is a triangle that has a side that contains tr2's vertice after this method
        tr1 = triangle
        tr2 = self
      end
      side, vert = tr1.side_and_vert_it_contains(tr2) 
      sides = Array.new | [tr1.ab, tr1.bc, tr1.ca].delete_if { |e| e.equal?(side) } # other sides
      verts = Array.new | [tr2.a, tr2.b, tr2.c].delete_if { |e| e.equal?(vert) } # other vertices 
      if sides.any? { |s| verts.any? { |v| s.contains?(v) } } 
        true
      elsif verts.any? { |v| v == tr1.opposite(side) } 
        true
      else
        false
      end
    elsif self == triangle
      true
    else
      false
    end
  end

  def contains_any_vertice?(triangle)
    [triangle.a, triangle.b, triangle.c].any? { |v| contains?(v) }
  end

  def side_and_vert_it_contains(triangle)
    sides = [@ab, @bc, @ca]
    verts = [triangle.a, triangle.b, triangle.c]
    n = 0
    3.times do
      m = 0
      3.times do 
        if sides[n].contains?(verts[m])
          return sides[n], verts[m]
        end
        m += 1
      end
      n += 1
    end
    nil
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
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
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

  def sides_intersect?(triangle)
    if triangle.is_a?(Geometry::Triangle)
      ab = triangle.ab
      bc = triangle.bc
      ca = triangle.ca
      if [ab, bc, ca].any? { |s1| [@ab, @bc, @ca].any? { |s2| s1.intersection_point?(s2).is_a?(Geometry::Point) } }
        return true
      end
    end
    false
  end
end
