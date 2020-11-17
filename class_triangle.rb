class Triangle
    attr_reader :defined_triangle, :exist
    def initialize(side_a: nil, side_b: nil, side_c: nil, 
                        ang_a: nil, ang_b: nil, ang_c: nil)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @ang_a = ang_a
    @ang_b = ang_b
    @ang_c = ang_c

    @defined_triangle = defined(@side_a, @side_b, @side_c) || 
                                defined(@side_a, @side_b, @ang_a) ||
                                        defined(@side_a, @ang_a, @ang_b)
    @exist = two_sides_greater_third? && angs_180?
    end


    private

    def defined(*args)
        args.each do |n|
            unless n.is_a?(Integer) || n.is_a?(Float)
                return false
            end
        end
        true
    end

    def angs_180?
        if defined(@ang_a, @ang_b, @ang_c)
            @ang_a + @ang_b + @ang_c == 180
        else
            true
        end
    end
    def two_sides_greater_third?
        if defined(@side_a, @side_b, @side_c)
            ((@side_a + @side_b) > @side_c) && 
                    @side_a + @side_c > @side_b && 
                            @side_b + @side_c > @side_a
        else
            true
        end
    end
end

a = Triangle.new(side_a: 1, side_b: 3.65, side_c: 4)

puts a.defined_triangle #=> true
puts a.exist #=> true