class Line
  attr_reader :a, :b, :c, :exist

  def initialize(var1: nil, var2: nil, var3: nil) # var1 is 1st point or a, var2 is 2nd point or b, var3 is c
    if [var1, var2].are_kind_of?(Point)
      if var1 != var2
        @exist = true
        @a = var2.x - var1.x
        @b = var1.y - var2.y
        @c = var1.x * var2.y - var2.x * var1.y
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    elsif [var1, var2, var3].are_kind_of?(Integer, Float)
      if !(var1 == 0 && var2 == 0)
        @exist = true
        @a = var1
        @b = var2
        @c = var3
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise IncompatibleParamsError.new(self.class)
    end
  end
end
