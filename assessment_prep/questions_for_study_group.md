def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

how do you put that in words? 

the `block` is passed to the map method, but is every element of the collection passed to the block via the variable `letter`?
is the block taking a parameter or an argument? Is it `taking a parameter`, but the variable is `passed in as an argument`?

What exactly is an `enumerator`? What is that `enumerator` that is returned by the `each` method for example if no block is given?
---------------------------------------------------------------------------------------------------------------------
return value of break?
--> `Break` is only valid within a block. It lets you jump out of a block and returns `nil` or the provided argument to the caller.
----------------------------------------------
a = 5 # does it say: local variable `a` is pointing to an integer object with the value 5, or just to the integer 5?
----------------------------------------------------
how do you phrase the part after an argument is passed into a method --> 
a = 123
def a_method(num) 
  num # num, which is now referencing the same object as a
end

- a_method(a) basically a reference is passed into the method so the variable inside the method is pointing to the same object the local variable a is pointing to?
  --> how to put that in words?

do end block by itself doesn't create its own scope, but is there a way apart from for or while loop where you can actually create a block without a method call?
`loop` itself is a method but for and while is not?

`A block (of code) is defined by do/end (or {})`
`To create a separate (inner) scope, a block must follow a method invocation` --> from forum discussion

blocks further discussion after lesson 2 part that is mentioned in the study guide?

- is a variable that's been initialized within a method still called a "local" variable?

a block is passed into the method, but the elements from the each method for example are passed back into the block?

- markdown notation for strings `abc` or `'abc'` ?

- how to put into words when you have pass a variable/object into a method?
E.g.

def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
What values do `s` and `t` have? Why?

do |num| # --> can num be called a variable? 
  # ...
end


