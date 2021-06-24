require_relative './array.rb'
require_relative './error.rb'
require_relative './point.rb'

class Geometry::Line
  attr_reader :a, :b, :c, :m_si, :b_si, :exist

  def initialize(var1: nil, var2: nil, var3: nil) # var1 is 1st point or a, var2 is 2nd point or b, var3 is c
    if [var1, var2].are_kind_of?(Geometry::Point)
      if var1 != var2
        @exist = true
        linear_equation(var1, var2)
        if @b != 0
          slope_intercept_form(var1, var2)
        end
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

  private

  def linear_equation(pnt1, pnt2)
    @a = pnt2.x - pnt1.x
    @b = pnt1.y - pnt2.y
    @c = pnt1.x * pnt2.y - pnt2.x * pnt1.y
  end

  def slope_intercept_form(pnt1, pnt2)
    @m_si = -(@a / @b)
    @b_si = -(@c / @b)
  end 
end
