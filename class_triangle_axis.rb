
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
        line = Line.new(var1: @a, var2: @b)
        !line.is_there_point_on_me?(@c) 
    end
end

class Point
    attr_reader :x, :y
    def initialize(x, y)
        @x = x
        @y = y
    end
end

class Line
    def initialize(var1: nil, var2: nil)
        if (var1 && var2).is_a?(Point)
            @k = (var2.y - var1.y) / (var2.x - var1.x)
            @b = var1.y - var1.x * (var2.y - var1.y) / (var2.x - var1.x)
        elsif (var1 && var2).is_a?(Integer || Float)
            @k = var1
            @b = var2
        else
            false
        end 
    end

    def is_there_point_on_me?(point)
        point.y == point.x * @k + @b
    end

    def is_line_correct?(x: nil, y: nil, x1: nil, y1: nil, x2: nil, y2: nil)
        y == (y1 - y2) / (x1 - x2) * (x - x1) + y1
    end
end

first_point = Point.new(2, 4)
second_point = Point.new(3, 6)
my_first_line = Line.new(var1: first_point, var2: second_point)

third_point = Point.new(4, 8)
puts my_first_line.is_there_point_on_me?(third_point) #=> true

my_second_line = Line.new(var1: 2, var2: 0)
fourth_point = Point.new(15, 30)
puts my_second_line.is_there_point_on_me?(fourth_point) #=> true

#####
a = Point.new(1, 5)
b = Point.new(-7, -3)
c = Point.new(14, 20)
abc = Triangle.new(a: a, b: b, c: c)
puts abc.exist_triangle #=>true