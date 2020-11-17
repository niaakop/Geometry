class Triangle
    attr_reader :exist_triangle
    def initialize(x1, y1, x2, y2, x3, y3)

    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
    @x3 = x3
    @y3 = y3

    @exist_triangle = not_on_one_line? && points_dont_match?
    end

    private

    def not_on_one_line? 
        !(@x1 == (@x2 && @x3)) && !(@y1 == (@y2 && @y3))
    end

    def points_dont_match?
     !(@x1 == @x2 && @y1 == @y2) && 
     !(@x2 == @x3 && @y2 == @y3) && 
     !(@x3 == @x1 && @y3 == @y1)  
    end
end

a = Triangle.new(x1 = 1, y1 = 2, x2 = 3, y2 = 4, x3 = 5, y3 = 6)

puts a.exist_triangle #=> true
