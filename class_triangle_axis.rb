
class Triangle
    attr_reader :exist_triangle
    def initialize(a: nil, b: nil, c: nil)

    @a = a
    @b = b
    @c = c

    @exist_triangle = not_on_one_line? 
    end

    private

    def not_on_one_line? 
        @line = Line.new(a: @a, z: @b)
        !@line.is_there_point_on_me?(@c) 
    end
end

class Point
    def initialize(x, y)
        @x = x
        @y = y
    end
    def x
        @x
    end
    def y
        @y
    end
end

class Line
    def initialize(a: nil, z: nil, k: nil, b: nil)
        @a = a
        @z = z
        @k = k
        @b = b
        if (@a && @z) != nil
            @init_points = true
        elsif (@k && @b) != nil
            @init_coefs = true
        else
            false
        end 
    end

    def is_there_point_on_me?(point)
        @point = point
        if @init_coefs
            @point.y == @point.x * @k + @b
        elsif @init_points
            @point.y - @a.y == (@z.y - @a.y) / (@z.x - @a.x) * (point.x - @a.x)
        else
            false
        end

    end
end

first_point = Point.new(2, 4)
second_point = Point.new(3, 6)
my_first_line = Line.new(a: first_point, z: second_point)

third_point = Point.new(4, 8)
puts my_first_line.is_there_point_on_me?(third_point) #=> true

my_second_line = Line.new(k: 2, b: 0)
fourth_point = Point.new(15, 30)
puts my_second_line.is_there_point_on_me?(fourth_point) #=> true

#####
a = Point.new(1, 5)
b = Point.new(-7, -3)
c = Point.new(14, 20)
abc = Triangle.new(a: a, b: b, c: c)
puts abc.exist_triangle #=>true