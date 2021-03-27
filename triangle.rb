class Triangle
  attr_reader :exist, :a, :b, :c

  def initialize(a: nil, b: nil, c: nil)
    @a = a
    @b = b
    @c = c
    if [@a, @b, @c].are_kind_of?(Point)
      if not_on_one_line?
        @exist = true
      else
        @exist = false
        raise DegenerateShapeError.new(self.class)
      end
    else
      @exist = false
      raise IncompatibleParamsError.new(self.class)
    end
  end

  private

  def not_on_one_line?
    line = Line.new(var1: @a, var2: @b)
  rescue DegenerateShapeError => e
    if e.cls == Line
      !@c.is_on?(line)
    else
      raise e
    end
  end
end
