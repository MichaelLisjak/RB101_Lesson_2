def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)


how do you put that in words? 

the `block` is passed to the map method, but is every element of the block passed to the block via the variable `letter`?

What exactly is an `enumerator`? What is that `enumerator` that is returned by the `each` method for example if no block is given?
---------------------------------------------------------------------------------------------------------------------
is saying the variable a is pointing to object xy the same as saying the variable a is referencing the object xy? Is one more precise than the other?
-----------------------------------------------------
return value of break?
--> Break is only valid within a block. It lets you jump out of a block and returns nil or the provided argument to the caller.

a = 5 # does it say: local variable a is pointing to an integer object with the value 5, or just to the integer 5?


