=begin
def defined(*args)
  args.each do |n| 
      unless n.is_a? Integer
          return false
      end
  end
  true
end

puts defined(1, 5, 8, "a")

a = 5
b = 6
puts a || begin 


class MyClass
  def initialize
      "initialize"
  end
end

a = MyClass.new
b = MyClass.new
c = 0
puts (b && a).is_a?(MyClass)

def blabla(a: nil, b: nil, c: nil)
  puts a, b, c
end

blabla(a: 4, c: 5, b: 15)
var1 = 14
var2 = 2
puts var1.is_a?(Integer)|| var1.is_a?(Float) && 
      var2.is_a?(Integer) || var2.is_a?(Float)
class Point
  attr_reader :x, :y
  def initialize(x, y)
      @x = x
      @y = y
  end
  def is_on?(line)
      @y == @x * line.k + line.b
  end
end

my1 = Point.new(1, 5)
my2 = Point.new(1, 5)
puts my1 == my2
def blabla
  if true
      return true
  end
  false
end
puts blabla

def are_num?(*args)
  i = 0
  until i == args.length
    return false if !(args[i].is_a?(Integer) || args[i].is_a?(Float))
    i += 1
  end     
  true 
end

puts are_num?(4, 5.5, 14, 123)#, 0.5.are_num?

=end

#, (3, 1.8, 4).are_num?, (0.3, 0.6, 1).are_num?


class MyError < StandardError
  attr_reader :cls
  def initialize(msg, cls) #are texts necessary here?
    @cls = cls
    super("#{msg}. #{cls} class")
  end
end

begin
  raise MyError.new("blabla")
# rescue StandardError => e 
#   puts e.cls 
end
