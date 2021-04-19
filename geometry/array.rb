class Array
  def are_kind_of?(*cls)
    self.all? { |i| cls.any? { |c| i.kind_of?(c) } }
  end
end
