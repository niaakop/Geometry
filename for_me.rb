class Array
  def are_all_instances_of?(*type)
    self.all? { |i| type.any? { |t| i.is_a?(t) } }
  end
end

p [14, 123.34, "asd"].are_all_instances_of?(Integer, Float)