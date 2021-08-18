# ruby basically uses pass-by-value for references
# it passes a copy of the reference ob the passing object into the method. So if the object is reassigned to a variable inside of the method, that doesn't change where the reference of the variable outside of the method points to
# this is why if you reassign an immutable object inside the method, is appears the by pass by value since the original object isn't changed
# if it's a mutable object like a string, and you mutate it inside of the method, it can still do that, since it is just a copy of the reference, but that means the variable? that is passed into the method points to the same object 

str = "abc"

def a_method (string)
  string << "def"
end

p a_method(str)
p str