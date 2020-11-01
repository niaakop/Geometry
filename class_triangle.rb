class Triangle
    attr_reader :defined
    def initialize(side_a: nil, side_b: nil, side_c: nil, 
                        ang_a: nil, ang_b: nil, ang_c: nil)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @ang_a = ang_a
    @ang_b = ang_b
    @ang_a = ang_c
    @defined = three_sides || two_sides_one_angle || one_side_two_angs
    end
    private
    def three_sides
        ((@side_a != nil) & (@side_b != nil) & (@side_c != nil))
    end
    def two_sides_one_angle
        ((@side_a != nil) & (@side_b != nil) & (@ang_a != nil)) 
    end
    def one_side_two_angs
        ((@side_a != nil) & (@ang_a != nil) & (@ang_b != nil))
    end
end

a = Triangle.new(side_a: 14, side_b: 51, side_c: 543)

puts a.defined # => true
