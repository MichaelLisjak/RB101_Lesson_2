# Example 1

a = "hi there"
b = a
a = "not here"

What does the following code return? What does it output? Why? What concept does it demonstrate?
What are a and b?
------------------------------------------------------------

this code doesn't output anything since the local variables `a` and `b` are only initialized and variable `a` is reassigned but they are never used.

if you would add the line `puts a` and `puts b` however, these lines would output
`puts a` # => `'not there'`
`puts b` # => `'hi there'`

but method invocations would return `nil`

the reason is that the local variable `a` on `line 1` is initialized with the string `'hi there'`, but since it is reassigned on `line 3` with the string `'not there'` this is what the `puts` method outputs

local variable `b` on `line 2` is initialized with the same string that variable `a` is pointing to which is `"hi there"`, and since it is never reassigned, that is what the `puts` method on `line 5` outputs

Time: ?
-----------------------------------
# Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = "hi there"
b = a
a << ", Bob"
What are a and b?
-------------------------
On `line 1` the local variable `a` is initialized with the string `hi there`
On `line 2` teh local variable `b` is initialized with the same string that `a` is referencing which is `hi there`
On `line 3` the `<<` method is invoked on `a` and takes the string ` Bob` as an argument.
The `<<` method mutates the string object it is invoked on and in that case it appends the string ` Bob` to the string `hi there` which `a` is referencing.

Because `a` and `b` are both referencing the same string object they are both referencing the string `hi there Bob` now.
# notes: the String#<< method modifies the object that called it 
Time: 5:40
-------------------------------------
# Example 3 
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = [1, 2, 3, 3]
b = a
c = a.uniq

What are a, b, and c? What if the last line was `c = a.uniq!`?
----------------
On `line 1` the local variable `a` is initialized with an array of integers `[1, 2, 3, 3]`
On `line 2` the local variable `b` is initialized with the same array that `a` is referencing

When the method `uniq` is invoked on `a` on `line 3` it returns an array with all of the elements of the array that `a` is referencing
without any duplicates. In that case it's `[1, 2, 3]`. This is what the local variable `c` is initialized with.

So after the code is executes `a` and `b` are referencing the string `[1, 2, 3, 3]` and `c` is referencing the string `[1, 2, 3]`

If the last line was `c = a.uniq!`, then all three variables `a`, `b` and `c` would be referencing the string `[1, 2, 3]` because `uniq!` would 
mutate the array it is invoked on, and in that case the array that variable `a` and therefore also variable `b` is referencing.

Time: 5:20
----------------------
# Example 4
What does the following code return? What does it output? Why? What concept does it demonstrate?
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
--------------------
On `line 5` the local variable `a` is initialized with an array of integers from `1` to `3`. This array is passed into the method invocation `test` as 
an argument on `line 6`. Inside the method the `map` method is invoked onto `b` which is referencing the array that is passed into `test` and takes a block 
that is defined by the curly braces. Within the block every element of the array that the `map` method iterates through is passed into the block via the parameter
`letter`. The element is passed into a string "I like the letter: #{letter}" with string interpolation. The `map` method then returns a new array with every element being the string `"I like the letter: ..."` with the current letter from the array that the `map` method is invoked on. Nothing is outputed but the method `test` returns this string because it is the only and therefore the last line of code inside the method.

This example demontrates that the `map` method performs transformation and will return a new array containing the return values of the block that is passed into it for every element it iterates through.

Time: 7:42
-----------------
# Example 5
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 5.2
b = 7.3

a = b

b += 1.1

What is `a` and `b`? Why? 
-------------------------
On `line 1` the local variable `a` is initialized with the float value `5.2` and on `line 2` the local variable `b` is initialized with the float value `7.3`.
On `line 4` when `a` is reassinged to the value that `b` is referencing, both variables point to the float value of `7.3`

On `line 6` the float value `b` is referencing is increased by `1.1` and therefore effectively reassigned with a new float value of `8.4`

So after the code is executed, `a` is still referencing `7.3` but `b` is now referencing `8.4`

This demonstrates that in ruby, float objects can't be mutated, and reassignment merely changes the object that a variable is referencing.

Time: 5:05  
# Notes: increased by 1.1 or should I say reassigned to 7.3 + 1.1?
--------------------------
# Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
-----------------------------
On `line 1-4` the method `test` is defined and takes a parameter `str`. 
The local variable `test_str` is initialized with the string `Written Assessment` on `line 6` and then passed into the method invocation of `test` as an argument on `line 7`. Inside the method on `line 2` `str` which is referencing the same string object as `test_str` is reassinged to a new string object `str + '!'` and therefore at this point, references the string `Written Assessment!`. Because of that reassignment, the `downcase!` method on `line 3` is only invoked on that string object and not on the object that `test_str` is referencing. Therefore the `puts` method on `line 9` that takes `test_str` as an argument still outputs `Written Assessment` and returns `nil`

This example demonstrates that as soon as you reassign the paramter variable to a new object inside a method, you can no longer mutate the original object that has been passed into the method trough this parameter. 
# Notes: Better explanation of what that code demonstrates??

----------------------------
On `line 6` the local variable `test_str` is initialized with the string `Written Assessment`.
It is then passed into the method invocation of `test` as an argument on `line 7`.
The method `test` is definied on `line 1 - 4` and takes a parameter `str`. 
 Inside the method which is defined on `line 1 - 4` and takes a parameter `str` as a parameter the string object gets reassigned with the string value `Written Assessment` and an additional `!` at the end. Therefore at this point `str` references a new string and not the string that has been passed into it anymore. Because of that, the `downcase!` method on `line 3` which is mutating its calling object does not mutate the string that `test_str` is referencing. That's why on `line 9` when the `puts` method is invoked with `test_str` passed into it as an argument it will output 'Written Assessment" and returns nil.

This example demonstrates that reassignment changes which object a variable is referencing and that as soon as an object that is passed into a method as an argument is reassigned inside a method, changes made to that variable object are not gonna affect the object outside of the method.

Test: 9:11
------------------------------
# Example 7
What does the following code return? What does it output? Why? What concept does it demonstrate?
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
----------------------
On `line 1-3` the method `plus` is defined and takes two parameters `x` and `y`. 
On `line 5` the local variable `a` is initialized with the integer value `3` and on `line 6` the local.
variable `b` is initialized with the return value of the `plus` method invocation that takes `a` and `2` as arguments.

When `a` and `2` are passed into the method, inside the method `x` will get a copy of the reference of the object that `a` is referencing and `y` will get a copy of the reference of the integer object `2`.

Inside the method `x` is reassigned with the value that `x` is referencing plus `2`. Therefore `x` is now
referencing a new integer value of `5` which is what the `plus` method returns and what `b` will be initialized with.

Therefore the `puts` method on `line 8` that takes `a` as an argument will output `3` because is has not been reassigned and is therefore still pointing to the integer `3`. 
The `puts` method on `line 9` that takes `b` as an argument will output `5` because that's what is has been initialized with.

This code demonstrates that integers are immutable and that they can only be reassigned to different variables, but never be mutated.
-------------------------
# Example 8
What does the following code return? What does it output? Why? What concept does it demonstrate?
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
---------------
On `line 1-3` the method `increment` is defined and takes one parameter `x`
On `line 5` the local variable `y` is initialized with the string `a` and is then passed into the method invocation of `increment` as 
an argument.

When `y` is passed into the method, inside the method `x` will get a copy of the reference of the object that `y` is referencing, in that
case to the string `a`. The `<<` method that is invoked on `x` takes the string `b` as an argument and appends it to the string `a`, effectively mutating the string
`x` is and `y` are referencing. Therefore the `puts` method invocation on `line 8` which takes `y` as an argument will output `ab` and return `nil`.

This example demonstrates that objects that are passed into a method can be mutated inside the method.

-------------
# Example 9
What does the following code return? What does it output? Why? What concept does it demonstrate?
def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name 
---------------
On `line 1-3` the method `change_name` is defined and takes one parameter `name`
On `line 5` the local variable `change_name` is initialized with the string `jim` and is then passed into the method invocation of `change_name` as 
an argument.

Inside the method on `line 2` `name` is reassigned to the string `bob`. Because reassignment doesn't mutate the original object that has been passed into the method, the variable `name` when passed into the `puts` method on `line 7` is still referencing the string `jim`, and therefore, this is what will be outputed. The `puts` method itself will return `nil`.

This code demonstrates that reassignment does not mutate the object, it merely changes what object a variable will point to.
---------------
# Example 10
What does the following code return? What does it output? Why? What concept does it demonstrate?
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name 
------------------------
On `line 1-3` the method `cap` is defined and takes one parameter `str`.
On `line 5` the local variable `name` is initialized with the string `jim` and is then passed into the method invocation of `cap` as 
an argument.

When `name` is passed into the method, inside the method `str` will get a copy of the reference of the object that `name` is referencing, in that
case to the string `jim`.

inside the method on `line 2` the mutating method `capitalize!` is invoked onto `str` and it therefore capitalizes the string `jim`, which will be `Jim` afterwards.
When the `puts` method is invoked on `line 7` and takes `name` as an argument, `Jim` will be outputed and the `puts` method will return `nil`.

This example demonstrates that objects that are passed into a method can be mutated inside the method.
-----------------------
# Example 11
What is `arr`? Why? What concept does it demonstrate?
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
-----------------------
On `line 1` the local variable `a` is initialized with the array [1, 3].
On `line 2` the local variable `b` is initialized with the array [2].
The local variable `arr` on `line 3` is initialized with an array containing 2 elements which `a` and `b` are referencing.
Therefore `arr` on `line 4` will reference the array `[[1, 3], [2]]`

When the element at index `1` of the array that `a` is referencing is reassigned with the integer `5`, the array that `a` is referencing 
will be mutated and will now be `[1, 5]`
Because this array is the first element of the array that `arr` is referencing, this array will also be mutated and will now be `[[1, 5], [2]]` on 
`line 7`
---------------------
# Example 12
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
------------
On `line 1` the local variable `arr1`  is initialized with a string array containing 3 elements `a` `b` and `c`
On `line 2`  the local variable `arr2` is initialized with the return value of the `dup` method that is invoked on `arr1`
dup returns a copy of the array object that `arr1`  is referencing so `arr2` is referencing a new object.
On `line 3-5` the `do..end` block is passed into the `map!` method which itself is invoked on `arr2`  The block takes a parameter `char` through which every element that `map!` iterates through will be passed into the block.
Inside the block the `upcase` method is invoked on `char` and returns the uppercase version of the given string element. Because the `map!` method performs transformation and returns the array it is invoked on with every element being the return value of the given block, it will mutate the array so that every string element is in uppercase letters which would be `['A', 'B', 'C']`.

On `line 7` the `puts` method that takes `arr1` as an argument will output `a`, `b` and `c` on separate lines and on `line 8` the `puts` method that takes `arr2` as an argument will output `A`, `B` and `C` on separate lines They both return `nil`

This demonstrates the concept of mutability, and in that case that the `map!` method mutates the array it is invoked on.
--------------








