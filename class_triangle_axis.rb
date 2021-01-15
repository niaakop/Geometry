
class Triangle
    attr_reader :exist
    def initialize(a: nil, b: nil, c: nil)

    @a = a
    @b = b
    @c = c

    @exist = not_on_one_line? 
    end

    private

    def not_on_one_line? 
        line = Line.new(var1: @a, var2: @b)
        if line.exist
            return !@c.is_on?(line)
        end 
        false
    end
end

class Point
    attr_reader :x, :y
    def initialize(x, y)
        @x = x
        @y = y
    end
    def is_on?(line)
        @y == @x * line.k + line.b
    end
    def is_equal?(point)
        @x == point.x && @y == point.y
    end
end

class Line
    attr_reader :k, :b, :exist
    def initialize(var1: nil, var2: nil) #var1 is 1st point or k, var2 is 2nd point or b
        if (var1 && var2).is_a?(Point) && !var1.is_equal?(var2)
            @k = (var2.y - var1.y) / (var2.x - var1.x)
            @b = var1.y - var1.x * (var2.y - var1.y) / (var2.x - var1.x)
            @exist = true
        elsif var1.is_a?(Integer)|| var1.is_a?(Float) && 
                var2.is_a?(Integer) || var2.is_a?(Float)
            @k = var1
            @b = var2
            @exist = true
        else
            #raise StandardError.new "Wrong parameters of line initialize"
            @exist = false
        end 
    end

#    def is_line_correct?(x: nil, y: nil, x1: nil, y1: nil, x2: nil, y2: nil)
#        y == (y1 - y2) / (x1 - x2) * (x - x1) + y1
#    end
end

first_point = Point.new(2, 4)
second_point = Point.new(3, 6)
my_first_line = Line.new(var1: first_point, var2: second_point)

third_point = Point.new(4, 8)
puts third_point.is_on?(my_first_line) #=> true

my_second_line = Line.new(var1: 2, var2: 0)
fourth_point = Point.new(15, 30)
puts fourth_point.is_on?(my_second_line) #=> true

#####
a = Point.new(1, 5)
b = Point.new(1, 6)
c = Point.new(14, 20)
abc = Triangle.new(a: a, b: b, c: c)
puts abc.exist #=>true