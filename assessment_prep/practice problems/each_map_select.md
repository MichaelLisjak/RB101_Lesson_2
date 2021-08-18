# Example 1
What does the following code return? What does it output? Why? What concept does it 	demonstrate?
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
-------------------------------------------
On `line 1` the local variable `array` is initialized with an array of integers from `1-5`

On `line 3-5` the `do..end` block that takes one parameter `num` is passed into the `select` method invocation, which itself is invoked onto `array`. While the `select` method iterates through the array that the local variable `array` is referencing, every element is passed into the block as an argument through the variable `num`

On `line 4` whenever the `odd?` method invocation on `num` returns true, the if condition evaluates to true and the `puts` method is invoked and takes `num` as an argument. Since `odd?` will return true for the integer elements `1`, `3` and `5` in the array, the `puts` method will be invoked and outputs those values onto the screen on separate lines. 

The `puts` method will always return `nil` so this is what the block will return and because the select method only selects those elements for which the given block returns something truthy, it will not select any elements because `nil` is considered falsey.
Without any elements selected, the `select` method will return an empty array.

This code demonstrates that the `select` method only cares for the truthiness of what the block returns, and in that case that `nil` is considered falsey in ruby.

# Notes: is num a variable? What is it for those elements that are even and puts is not executed? do I have to mention that the block returns nil if no code is executed?


--------------------------------------------
This code will output the numbers `1`, `3` and `5` on separate lines and return an empty array.
On `line 1` the local variable `array` is initialized with an array of integers from `1-5`

On `line 3-5` the select method is invoked on the array and takes a block as an argument. Inside that block on `line 4` the `puts` method is invoked and takes the object that `num` is referencing as an argument, whenever the if statement evaluates the condition `num.odd?` as true. When the `odd?` method is invoked on `num` it returns true whenever `num` references an odd integer number. That's why the `puts` method will get invoked for the array elements `1`, `3` and `5` and they are therefore outputed.

The `puts` method itself returns `nil` and because the `select` method only selects values for which the given block evaluated to `true`, none of the objects are selected, and the `select` method returns an empty array.

This code demonstrates that the `select` method only cares for the truthiness of what the block returns, and in that case that `nil` is considered falsey in ruby.

Time: 10:33
------------------------------------------
# Example 2
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }

What does the following code return? What does it output? Why? What concept does it demonstrate?
----------------------------------------
This code will not output anything and it will return a new array with all the odd integer elements of `arr`

On `line 1` the local variable `arr` is initialized with an array containing the integer values from `1 to 10`

On `line 3` the `select` method is invoked on `arr` and takes a block defined by curly braces. Every element of the array is 
passed into the block via its parameter `n` and the `odd?` method is invoked on that element. 

The `odd?` method will return true for every odd element of the array, and the `select` method will select all elements for which the block returns a truthy value
and this is why it will return a new array with only the odd numbers in it.

This demonstrates that the select method only cares for the truthiness of the blocks return value and returns only the elements of the collection it is invoked on for which the blocks return value is evaluated to true.

# notes: Neccessary to write out the exact output like [1,3,5,7,9]? Can the "This demonstrates..." part be written more concise?

Time: 6:30
---------------------------------
# Example 3
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
--------------------------
On `line 1` the local variable `arr` is initialized with an array of integer numbers from `1 to 10`

On `line 3` the local variable `new_array` is initialized with the return value of the `select` method which is invoked on the array that `arr` is referencing.
The `select` method takes a block into which all elements of the array that `select` is iterating through are passed into via the parameter `n`
Inside the block `1` is added to the current element that the `select` method is iterating through, but it is never used. Since this statement `n + 1` evaluates to true, every element will be selected and the `select` method returns a new array with all the elements of the array that `arr` is referencing.

Because this is what the local variable `new_array` is initialized with, it's what will be outputed and also returned by the `p` method invocation on `line 6` which takes `new_array` as an argument.

This code demonstrates that the `select` method is only concerned for the truthiness of the return value of the given block and that everything except for `nil` and `false` evaluates to true in ruby.

Time: 8:00
# notes: n + 1 -->? a statement. A piece of code? a method invocation of Integer#+ on n, taking 1 as an argument?
----------------------------
# Example 4
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
-------------------------
On `line 1` the local variable `arr` is initialized with an array of integer numbers from `1 to 10`.

On `line 3` the local variable `new_array` is initialized with the return value of the `select` method which is invoked on the array that `arr` is referencing.
The `select` method iterates through `arr` and takes a block defined by `do..end` into which all elements of the array that `select` is iterating through are passed into via the parameter `n`.

Inside the block on `line 5` the `puts` method is invoked and takes `n` as an argument which is pointing to the current element that the `select` method is iterating through. Therefore every number from `1 to 10` will be outputed on a separate line. Because the `puts` method always returns `nil` which evaluates to false, the `select` method will not select any element and returns an empty array. `new_array` is therefore referencing an empty array and on `line 7` where this empty array is passed into the `p` method, `[]` is what will be outputed and returned.  

This code demonstrates that the `select` method is only concerned for the truthiness of the return value of the given block and that `nil` evaluates to false in ruby.

# Notes: Takes a block --> mention that it is defined by the do..end keywords?
# useless or void in the context
Time: 6:20
------------------------
# Example 5
What does the following code return? What does it output? Why? What concept does it demonstrate?
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
--------------------------
On `line 1` the local variable `words` is initialized with an array of string objects.

On `line 3` the local variable `new_array` is initialized with the return value of the `map` method that is invoked on the string array that `word` is referencing.
The `map` method iterates through `words` and takes a `do..end` block into which all elements of the array that `map` is iterating through are passed into via the parameter `word`.

Inside the block the `start_with?` method is invoked on every element that the `map` method is iterating through, and it takes the string `t` as an argument.
Therefore the `start_with?` method returns the boolean `true` for every string element that starts with `t` which in this case is `trip` and `talk`.
It will return `false` for every other element of the array.
Because `map` performs transformation and will return a new array with every element consisting of the return value of the given block, the `map` method will return
`[false, true, false, false, true]`
This is passed into the `p` method invocation on `line 7` and that's why this will be outputed and returned.

This example demontrates that the `map` method performs transformation and will return a new array containing the return values of the block that is passed into it for every element it iterates through.

Time: 8:08
-------------------------------
# Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
----------------------------
On `line 1` the local variable `arr` is initialized with an array of integer numbers from `1 to 10`

On `line 3` the `each` method is invoked onto the array object `arr` is referencing and it takes a block that is definied by the curly braces and takes a parameter `n` through which every element the `each` method iterates through is passed into the block.

inside the block the `puts` method is invoked and takes `n` as an argument. The `puts` method therefore outputs every element of the array on a separate line.
The each method returns the array itself.

This example demonstrates that the each method does not care about the return value of the block and always returns the array it is invoked on.


Time: 5:00
----------------------------------
# Example 7
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
-----------------------------
On `line 1` the local variable `arr` is initialized with an array of integer numbers from `1 to 10`

On `line 3` the local variable `incremented` is initialized with the return value of the `map` method that is invoked on the array that `arr` is referencing.
The `map` method takes a `do..end` block into which all elements of the array that the `map` method is iterating through are passed into via the parameter `n`

Inside the block `1` is added to the current element that the `map` method is iterating through, and thus the block will return every element value + 1. because the `map` method returns a new array with the return values of the block, it will return an integer array from `2 to 11` which is assigned to the local variable `incremented`.

When the `p` method is invoked on line 6 and takes `incremented` as an argument, it will output `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and also returns it.

This example demonstrates that the `map` method performs transformation and will return a new array containing the return values of the block that is passed into it for every element it iterates through.

Time: 6:00

# Notes: 1 is added, or more precise, the integer#+ method is invoked on `n` and takes 1 as an argument?
-----------------------------
# Example 8
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
----------------------------
On `line 1` the local variable `arr` is initialized with an array of integers from `1 to 10`.

On `line 3` the local variable `new_array` is initialized with the return value of the `map` method that is invoked on the integer array that `arr` is referencing.
The `map` method takes a `do..end` block into which all elements of the array are passed into via the parameter `n`

Inside the block on `line 4`, the `Integer#>` method is invoked on `n`, the current element of the array that `map` is iterating over. It will return `true` for every element that is greater than `1` and false for any element that is not. In the case of the array that `arr` is referencing, only for the first element `1` this will evaluate to false. It will evaluate to true for every other element of that array. Because the `map` method returns a new array with the return values of the block that is passed into it, the return value of `map` will be an array with 10 element of booleans, the first one being `false`, and the other nine being `true`. This is what the local variable `new_array` will be initialized with and this will be outputed and returned by the `p` method invocation on `line 6` that takes `new_array` as an argument.

This example demonstrates that the `map` method performs transformation and will return a new array containing the return values of its given block for every element that is passed into the block

# Notes: Should I mention that transformation is performed by map while explaining or is it okay to just have it in the last sentence in this example demonstrates...?
# How could I rephrase the last sentence this example demonstrates?
Time: 8:49
---------------------------------------------------
# Example 9
What does the following code return? What does it output? Why? What concept does it demonstrate?
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
--------------------------------
On `line 1` the local variable `arr` is initialized with an array of integers from `1 to 10`.

On `line 3` the local variable `new_array` is initialized with the return value of the `map` method that is invoked on the integer array that `arr` is referencing.
The `map` method takes a `do..end` block as an argument into which all elements of the array that the `map` method is iterating through are passed into via the parameter `n`

Inside the block on `line 5` the `puts` method is invoked and takes `n` as an argument which is pointing to the current element that the `map` method is iterating through. Therefore every number from `1 to 10` will be outputed on a separate line. Because the `puts` method always returns `nil` this is what the block returns for every element. Because the `map` method returns a new array with the return values of the given block, it will return an array with ten `nil` elements in it. 

This is what the local variable `new_array` will be initialized with and this will be outputed and returned by the `p` method invocation on `line 6` that takes `new_array` as an argument.

This example demonstrates that the `map` method performs transformation and will return a new array containing the return values of its given block for every element that is passed into the block.

Time: 3:13 (with copy and paste)
----------------------------
# Example 10
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = "hello"

[1, 2, 3].map { |num| a }
----------------------------
On `line 1` the local variable `a` is initialized with a string array `hello`

On `line 3` the `map` method is invoked onto the array `[1, 2, 3]` and it takes a block that is definied by the curly braces and takes a parameter `num` through which every element the `map` method iterates through is passed into the block.

The parameter `num` is not used inside the block though, and only the local variable `a` is used inside the block. Because `a` is referencing the string `hello`, this is what the block will return and what the `map` method will use for transformation, and therefore returns a new array with 3 string objects `hello` as elements.

Therefore `['hello', 'hello', 'hello']` is returned and nothing is outputed.

This example demonstrates that the `map` method performs transformation and will return a new array containing the return values of its given block for every element that is passed into the block.

# Notes: Not mention the parameter num at all since it doesn't have any purpose here?
Time: 5:20
----------------------------------
# Example 11
What does the following code return? What does it output? Why? What concept does it demonstrate?
[1, 2, 3].each do |num|
  puts num
end
-------------------------
On `line 1` the `each` method is invoked onto the array object `[1, 2, 3]` and it takes a block that is definied by the `do..end` keywords. The block takes a parameter `num` through which every element the `each` method iterates through is passed into the block.

the `puts` method on `line 2` takes `num` as a parameter and therefore outputs every element of the array on a separate line.
The each method returns the array it is invoked on.

This example demonstrates that the each method does not care about the return value of the block and always returns the array it is invoked on.

Time: 3:10
-------------


