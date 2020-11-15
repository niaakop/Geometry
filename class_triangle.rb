class Triangle
    attr_reader :defined
    def initialize(side_a: nil, side_b: nil, side_c: nil, 
                        ang_a: nil, ang_b: nil, ang_c: nil)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @ang_a = ang_a
    @ang_b = ang_b
    @ang_c = ang_c

    @defined = three_sides || two_sides_one_ang || one_side_two_angs
    end

    private
    def three_sides
        (@side_a.is_a? Integer) && (@side_b.is_a? Integer) && (@side_c.is_a? Integer)
    end

    def two_sides_one_ang
        (@side_a.is_a? Integer) && (@side_b.is_a? Integer) && (@ang_a.is_a? Integer)
    end

    def one_side_two_angs
        (@side_a.is_a? Integer) && (@ang_a.is_a? Integer) && (@ang_b.is_a? Integer)
    end
end

a = Triangle.new(side_a: 14, side_b: 51, ang_a: 543)

puts a.defined # => true
