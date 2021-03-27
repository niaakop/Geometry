class GeometryError < StandardError
end

class IncompatibleParamsError < GeometryError
  attr_reader :cls
  def initialize(cls)
    @cls = cls
    super("Incompatible Params Error. #{cls.to_s} class.")
  end
end

class DegenerateShapeError < GeometryError
  attr_reader :cls
  def initialize(cls)
    @cls = cls
    super("Degenerate Shape Error. #{cls.to_s} class.")
  end
end
