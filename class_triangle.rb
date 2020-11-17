class Triangle
    attr_reader :defined_triangle
    def initialize(side_a: nil, side_b: nil, side_c: nil, 
                        ang_a: nil, ang_b: nil, ang_c: nil)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @ang_a = ang_a
    @ang_b = ang_b
    @ang_c = ang_c

    @defined_triangle = defined(@side_a, @side_b, @side_c) || defined (side)
    end


    private
    def defined(*args)
        args.each do |n|
        puts n 
            unless n.is_a?(Integer) || n.is_a?(Float)
                return false
            end
        end
        true
    end
=begin
    def three_sides
        (@side_a.is_a? Integer || Float) && (@side_b.is_a? Integer || Float) && (@side_c.is_a? Integer || Float)
    end

    def two_sides_one_ang
        (@side_a.is_a? Integer || Float) && (@side_b.is_a? Integer || Float) && (@ang_a.is_a? Integer || Float)
    end

    def one_side_two_angs
        (@side_a.is_a? Integer || Float) && (@ang_a.is_a? Integer || Float) && (@ang_b.is_a? Integer || Float)
    end
    def angs_180?
        if @ang_a && @ang_b && @ang_c
            @ang_a + @ang_b + @ang_c == 180
        else
            true
        end
    end
    def two_sides_greater_third?
        if three_sides
            ((@side_a + @side_b) > @side_c) || @side_a + @side_c > @side_b || 
                                                @side_b + @side_c > @side_a
        else
            true
        end
    end
    public
    def exist?
        two_sides_greater_third? && angs_180?
    end
=end
end

a = Triangle.new(side_a: 1, side_b: 3.65, side_c: 3)

puts a.defined_triangle 