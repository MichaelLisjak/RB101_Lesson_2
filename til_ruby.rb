# If you use default parameters for methods in the following way, you have to use the same syntax also for invoking the method

def test_method(test: false)
  if test
    puts "true"
  else
    puts "false"
  end
end

test_method(test: true)
# --------------------------------------------------------------------

# if you call the method of the same name from the superclass with the keyword super, and you want to pass the exact same number of arguments to it, you can just leave out the arguments
# complete and just call "super"

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super               # year is automatically passed into the super method because it's the same argument than for the Truck::initialize method
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

# -------------------------------------------------------------------------
# Constants from classes are not available in the modules that are mixed in. You have to use self.class.CONSTANT to access them there

# -----------------------------------------------
# When two or more object types have a method with the same name, we can invoke that method with any of those objects. When we don't care what type of object is calling the method, we're using polymorphism. 
# Often, polymorphism involves inheritance from a common superclass. However, inheritance isn't necessary as we'll see in this assignment.

# -----------------------------------------------------------------------------------------------------------------------------

# class variables with the same name are overritten for ALL other classes if the subclass does have one with the same name e.g.

class Human
  @@age = 100

  def get_age
    puts "#{self.class} is #{@@age} years old"
  end
end

class Car < Human
  @@age = 10

end


risa = Human.new
porsche = Car.new


risa.get_age # Human is 10 years old
porsche.get_age # Car is 10 years old

# while class CONSTANTS are overritten and valid only for the class that they are defined in. If the superclass only has a constant and the subclass doesn't have one with the same name, then the 
# constant from the superclass is used, otherwise the class uses its own constant e.g.

class Human
  AGE = 100

end

class Car < Human
  AGE = 10

end


risa = Human.new
porsche = Car.new


puts risa.class::AGE # --> 100
puts porsche.class::AGE # --> 10

# --------------------------------------------------------------------------------------------------------------------------------------------

# :: is called a namespace resolution operator.

# ----------------------------------------------------------------

module Speak
  attr_accessor :language
  @language = 'eng'   # --> This would be a class instance variable. We havn't learnd about that for now
end

class Classroom
  include Speak
  
  def tell_language
    puts "I'm speaking #{@language}"
  end
end

my_class = Classroom.new
my_class.tell_language
p my_class.language

# Output: 
# I'm speaking
# nil

# WRONG conclusion: You can not create instance variables in modules. It seems you can not create class variables either, at least if you do, they can not be used in the class that you mixin the module
# WRONG! You can't define instance variables that way, neither in a module nor in a class! You can only do that inside an instance method. e.g. this would work:
module Speak
  attr_accessor :language
  def set_language
    @language = 'eng'
  end
end

my_class.set_language # then call method in the program so the @language instance variable gets initialized

# See also:

# Sidenote: what happens if you accidentally put an instance variable at the class level?

Copy Code
class Person
  @name = "bob"              # class level initialization

  def get_name
    @name
  end
end

bob = Person.new
bob.get_name                  # => nil
# The short answer is: don't do that for now. The long answer is that instance variables initialized at the class level are an entirely different thing called `class instance variables`. 
# You shouldn't worry about that yet, but just remember to initialize instance variables within instance methods.


# ---------------------------------------------------------------------------------------

# As of Ruby 2.7, it is now legal to call private methods with a literal self as the caller. Note that this does not mean that we can call a private method with any other object, not even one of the same type. 
# We can only call a private method with the current object.

# Example:

class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n #  nickname can be called on self although it's a private method
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!