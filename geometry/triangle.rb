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

  def self.intersect?(tr1, tr2)
    raise Geometry::IncompatibleParamsError.new(self.class) if !(tr1.is_a?(Geometry::Triangle) && tr2.is_a?(Geometry::Triangle)) 
    if tr1.sides_intersect?(tr2) || Geometry::Triangle.contains_any_vertice?(tr1, tr2) || tr1 == tr2
      true
    elsif Geometry::Triangle.side_and_vert_it_contains(tr1, tr2)
      side, vert = Geometry::Triangle.side_and_vert_it_contains(tr1, tr2).values_at(:side, :vert)
      other_sides = side[:tr].sides.reject { |e| e.equal?(side[:val]) } 
      other_verts = vert[:tr].vertices.reject { |e| e.equal?(vert[:val]) } 
      if other_sides.any? { |s| other_verts.any? { |v| s.contains?(v) } } || other_verts.any? { |v| v == side[:tr].opposite(side[:val]) } 
        true
      else
        false
      end
    else
      false
    end
  end

  def self.contains_any_vertice?(tr1, tr2)
    [tr1.a, tr1.b, tr1.c].any? { |v| tr2.contains?(v) } || [tr2.a, tr2.b, tr2.c].any? { |v| tr1.contains?(v) }
  end

  def self.side_and_vert_it_contains(tr1, tr2)
    n = 0
    3.times do
      m = 0
      3.times do 
        if tr1.sides[n].contains?(tr2.vertices[m])
          return {side: {tr: tr1, val: tr1.sides[n]}, vert: {tr: tr2, val: tr2.vertices[m]}}
        elsif tr2.sides[n].contains?(tr1.vertices[m])
          return {side: {tr: tr2, val: tr2.sides[n]}, vert: {tr: tr1, val: tr1.vertices[m]}}
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

  def sides
    @sides ||= [@ab, @bc, @ca]
  end

  def vertices
    @vertices ||= [@a, @b, @c]
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
