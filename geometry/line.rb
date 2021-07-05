require_relative './array.rb'
require_relative './error.rb'
require_relative './point.rb'

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
    elsif [var1, var2, var3].are_kind_of?(Integer, Float)
      if !(var1 == 0 && var2 == 0)
        @exist = true
        @a = var1
        @b = var2
        @c = var3
      else
        @exist = false
        raise Geometry::DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise Geometry::IncompatibleParamsError.new(self.class)
    end
  end

  def intersection_point?(line)
    a1 = self.a
    b1 = self.b
    c1 = self.c
    a2 = line.a
    b2 = line.b
    c2 = line.c
    if b1 != 0
      self.slope_intercept_form
      k_si1 = self.k_si
      b_si1 = self.b_si
    end

    if b2 != 0
      line.slope_intercept_form
      k_si2 = line.k_si
      b_si2 = line.b_si
    end

    if !line.is_a?(Geometry::Line)
     raise ArgumentError.new("intersection of a line with an instance of another class is not possible")
    end

    if (b1 == 0) ^ (b2 == 0)
      if b1 == 0
        x = -c1 / a1
        y = k_si2 * x + b_si2
      else
        x = -c2 / a2
        y = k_si1 * x + b_si1
      end

    else
      if (b1 == 0) && (b2 == 0)
        return false
      else
        if k_si1 == k_si2
          return false
        else
          x = (b_si2 - b_si1) / (k_si1 - k_si2)
          y = k_si1 * x + b_si1
        end
      end
    end
    Geometry::Point.new(x, y)
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
end
