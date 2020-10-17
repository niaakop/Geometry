class Person
  def speak
    puts "Hey, Tj!"
  end
  def whisper_louder
    whisper
  end
 private
 def whisper
    puts "His name's not really 'Tj'."
  end
 protected
 def self.greet
   puts "Hey, wassup!"
 end
end

class Me 
  def be_nice
    Person.greet
  end
end

class You < Person
  def your_whisper
    whisper
  end
  def your_greet
    Person.greet
  end
end

someone = Person.new
me = Me.new
you = You.new
someone.speak
#someone.whisper
someone.whisper_louder
#someone.greet
#someone.be_nice

#me.speak
#me.whisper
#me.whisper_louder
#me.greet
me.be_nice

you.speak
#you.whisper
you.whisper_louder
#you.greet
#you.be_nice
you.your_whisper
you.your_greet