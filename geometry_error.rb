class GeometryError < StandardError
end

class IncompatibleParamsError < GeometryError
  attr_reader :cls
  def initialize(msg = "Incompatible Params Error", cls) 
    @cls = cls
    super("#{msg}. #{cls} class.")
  end
end

class DegenerateShapeError < GeometryError
  attr_reader :cls
  def initialize(msg = "Degenerate Shape Error", cls) 
    @cls = cls
    super("#{msg}. #{cls} class.")
  end
end