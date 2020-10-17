class Person
  def self.public_method
    puts "this is public method"
  end
  def speak
    puts "Hey, Tj!"
  end
  def whisper_louder
    whisper
  end
  protected
  def self.greet
   puts "Hey, wassup!"
  end
  def protected_instanse_method 
    puts "this is protected method"
  end
  private
  def self.private_method
    puts "this is private method"
  end
  def whisper
    puts "His name's not really 'Tj'."
  end
end

class You < Person
  def self.person_public_method
    Person.public_method
  end
  def self.person_greet
    Person.greet
  end
  def your_protected_instanse_method
    protected_instanse_method
  end
  def self.person_private_method
    Person.private_method
  end
  def your_whisper
    whisper
  end
end

someone = Person.new
you = You.new
someone.speak
#someone.whisper
someone.whisper_louder
#someone.greet
#someone.be_nice
#someone.protected_instanse_method

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
you.your_protected_instanse_method

You.your_public_method
You.your_greet
You.your_private_method