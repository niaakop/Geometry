require_relative './array.rb'
require_relative './error.rb'
require_relative './point.rb'
require_relative './line_segment'

class Geometry::Line
  attr_reader :a, :b, :c, :k_si, :b_si, :exist

  def initialize(var1: nil, var2: nil, var3: nil) # var1 is 1st point or a, var2 is 2nd point or b, var3 is c
    if [var1, var2].are_kind_of?(Geometry::Point)
      if var1 != var2
        @exist = true
        @a = var1.y - var2.y
        @b = var2.x - var1.x
        @c = var1.x * var2.y - var2.x * var1.y
      else
        @exist = false
        raise Geometry::DegenerateShapeError.new(self.class)
      end
    elsif [var1, var2, var3].are_kind_of?(Integer, Float, Rational)
      if !(var1 == 0 && var2 == 0)
        @exist = true
        @a = var1.rationalize
        @b = var2.rationalize
        @c = var3.rationalize
      else
        @exist = false
        raise Geometry::DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def intersection_point?(shape)
    if shape.is_a?(Geometry::Line)
      line = shape
      a1 = @a
      b1 = @b
      c1 = @c
      a2 = line.a
      b2 = line.b
      c2 = line.c
      if b1 != 0
        slope_intercept_form
        k_si1 = @k_si
        b_si1 = @b_si
      end

      if b2 != 0
        line.slope_intercept_form
        k_si2 = line.k_si
        b_si2 = line.b_si
      end

      if (b1 == 0) && (b2 != 0)
        x = -c1 / a1
        y = k_si2 * x + b_si2

      elsif (b1 != 0) && (b2 == 0)
        x = -c2 / a2
        y = k_si1 * x + b_si1

      elsif (b1 == 0) && (b2 == 0)
        return false

      else
        if k_si1 == k_si2
          return false
        else
          x = (b_si2 - b_si1) / (k_si1 - k_si2)
          y = k_si1 * x + b_si1
        end
      end
      Geometry::Point.new(x, y)

    elsif
      shape.is_a?(Geometry::LineSegment)
      shape.intersection_point?(self)

    else 
      raise ArgumentError.new("intersection of a line with an instance of #{shape.class} class is not possible") 
    end
  end

  def linear_equation # ax + by + c = 0
    @a = var1.y - var2.y
    @b = var2.x - var1.x
    @c = var1.x * var2.y - var2.x * var1.y
  end

  def slope_intercept_form # y = kx + b
    @k_si = -(@a / @b)
    @b_si = -(@c / @b)
  end 

  def contains?(point)
    if point.is_a?(Geometry::Point)
      (point.x * @a + point.y * @b + @c).abs < Math.cbrt(Float::EPSILON)
    elsif point.is_a?(Geometry::LineSegment)
      point.line == self
    else
      ArgumentError.new("instance content of #{point.class} class in line is not possible")
    end
  end
end
