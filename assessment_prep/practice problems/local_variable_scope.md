# Example 1

a = "Hello"
b = a
a = "Goodbye"
puts a
puts b


What does the following code return? What does it output? Why? What concept does it demonstrate?
-------------------------------------

On `line 1` the local variable `a` is initialized with the string `Hello`
On `line 2` the local variable `b` is initialized with the same string that `a` is referencing, which is `Hello`

On `line 3` `a` gets reassigned to a new string `Goodbye` and so at this point `b` is still referencing the string `Hello` and `a` is referencing the string `Goodbye`

Therefore `puts a` on `line 4` will output `Goodbye` and return `nil` and `puts b` on `line 5` will output `Hello` and return `nil`

This demonstrates that variable assignment is non-mutating and that reassignment merely points the variable to a different object.

Time: 4:07

-----------------------------------
On `line 4` the puts method will output `Goodbye` and return `nil`
On `line 5` the puts method will output `Hello` and return `nil`

That's because the local variable `a` is initialized with the string object `Hello`. On line 2 the local variable `b` is initialized with the object that variable `a` is referencing which is `Hello`

Now on `line 3` variable `a` is reassigned with a new string object `Goodbye`. Since `a` is now pointing to a new string object `Goodbye` and `b` is still pointing to the string object `Hello`, This is what the puts methods on line 4 and 5 output. The return value of puts is `nil`, this is what's returned by them.

The concept that is demonstrated here, is that variable reassignment does not mutate the object, It merely points the local variable to another object. 

Time: 6:30
--------------------------------------------------------
On `line 1` the local variable `a` is initialized with the string `Hello`
On `line 2` the local variable `b` is initialized with the same string object that `a` is referencing, which is `Hello`
On `line 3` the variable `a` is reassigned to a new string `Goodbye` and therefore pointing to a new string object. 

This is why on `line 4` the `puts` method invokation which takes `a` as an argument outputs `Goodbye`, while the `puts` method invokation takes
`b` as an argument, which itself is still pointing to the string `Hello`, so this is what `puts` outputs here.

Both `puts` method invokations return `nil`

This code example demonstrates variable assignment rules in ruby, specifically that reassigning a variable to a new object does not mutate the original object that the variable referenced before.

Time 5:55
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Example 2

a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b

What does the following code return? What does it output? Why? What concept does it demonstrate?

This code will create a NameError: undefinied local variable or method `b`
The reason for that is that the local variable `b` is initialized within the `do end` block. Since the `do end` block that's passed into the loop method creates its own scope, the variable `b` is not accessible in the outer scope and therefore the `puts` method on `line 12` cannot access this variable.

This example demonstrates the local variable scope of ruby and that local variables created in an inner scope cannot be accessed outside of that inner scope.

Time: 3:00
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Example 3

a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

What does the following code return? What does it output? Why? What concept does it demonstrate?

The `puts` method on `line 11` will output `3` and return `nil`
The `puts` method on `line 12` will output `2` and return `nil`

On `line 1` the local variable `a` is initialized with an integer object which has the value 4
Inside the loop on `line 5` the local variable `c` is initialized with the integer object that has the value `3`. On `line 6` the local variable `a` is reassigned to the the object `c` is referencing to which is `3`. 
Since this is what `a` is pointing to, it's what the `puts` method on `line 10` will output
the local variable `b` is never reassigned and therefore still pointing to the integer object with the value `2`. That's why this will be the output of the `puts` method on `line 11`

This example demonstrates the local variable scoping rules of ruby. In this case, that a local variable initialized in an outer scope can be accessed in an inner scope.

Time: 7:35
----------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Example 4

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

What does the following code return? What does it output? Why? What concept does it demonstrate?

The code will output `hello` 3 times and return `nil`

The string object `hello` is passed into the example method on `line 10` as an argument. 
The local variable `i` is initialized with the integer object 3 on `line 2` The `loop` method that is called on `line 3` takes a `do end` block as an argument. In this block the puts method is called on `line 4` and takes the variable str as an argument which itself is pointing to the string object `hello`
On `line 5` the local variable `i` is reassigned with `i - 1` and since the `break` on `line 6` is called if `i` equals `0`, the block is executed a total of 3 times, calling the `puts` method 3 times with the string object `hello` as an argument.

since break is the last keyword that is used and it returns `nil` per default, that is what the example method returns

This example demonstrates that the local variable `i` which is initialized on `line 2` is accessible within the `do end` block since local variables initialized in an other scope are accessible in an inner scope

Time: 11:36
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Example 5

def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)

What does the following code return? What does it output? Why? What concept does it demonstrate?

The `greetings` method on `line 8` will output `Hello` and `Goodbye` on two separate lines, and it returns `nil`

on `line 1-4` we define a method `greetings` which takes one parameter `str`

on `line 2` inside the method we call the `puts` method and pass the object that the variable `str` is referencing as an argument
on `line 3` we call the `puts` method and pass the argument of the string object `Goodbye` to the method

When we initialize the local variable `word` on `line 6` with the string object `Hello`, this string object will be passed to the `greetings` method on `line 8`
So since inside the method the variable `str` is referencing to the same string object than `word`, this is what is passed to the puts method on `line 2`

This example demonstrates the local variable scoping rules of ruby and that local variables that are initialized outside of a method have to be passed into the method as an argument in order to be accessible there.

Time: 8:30
-------------------------------------------------------------

This code will output `Hello` and `Goodbye` on two separate lines and it returns `nil`

On `line 6` the local variable `word` is initialized with the string object `Hello`
It is then passed into the `greetings` method on `line 8` as an argument.

Inside the method on `line 2` the `puts` method is called and takes `str` as an argument, which is pointing to the string object `Hello` at this point
and therefore this is what `puts` will output

On `line 3` the `puts` method is called with the string object `Goodbye` as an argument and it will output that. 
Since this is the last line of code that is executes inside the method and `puts` always returns `nil` this is what the method `greetings` will return.

The concept that this code demonstrates is that in order for local variables to be accessible inside a method, it has to be passed into it as an argument, because a method creates its own self-contained variable scope.

Time: 5:55
----------------------------------------------------------------
# Example 6

arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"

What does the following code return? What does it output? Why? What concept does it demonstrate?

This code will output `Your total is 10` and return `nil`

On `line 1` the local variable `arr` is initialized with an array object `[1, 2 ,3, 4]`
On `line 2` and `line 3` the local variables `counter` and `sum` are both initialized with the integer value `0`

When the `loop` method is invoked on `line 6` it takes a `do end` block that is defined on `line 6-10`
Inside the block the variable `sum` is reassigned to the value it is currently pointing to plus the current element of the array that the variable `arr` is referencing
That's because `sum += 1` is rubys syntactical sugar für `sum = sum + arr[counter]`

On line 8 `counter` is incremented by `1` and on `line 9` the `break` keyword will end the interation of the `loop` method as soon as the value of the integer that the variable counter is referencing is equal to the size of the the array which means that is has iterated through every element of the array object.

Since the value of the integer that `sum` is referencing is inserted into the string object passed into the `puts` method on `line 12` and its value is now 10 after the last iteration of the `loop` the string `Your total is 10` is returned

Time: 10:45
---------------------------------
# Example 7
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
-----------------------------
On `line 1` the local variable `a` is initialized with the string `Bob`

The `do..end` alongside the `times` method invocation on `line 3-5` creates a block within which `a` is reassigned to the string `Bill`

Because `a` is initialized in the outer scope of the block it is accessible inside the block and can therefore be reassigned there. On `line 7` the `p` method invocation which takes `a` as an argument is therefore outputing and returning `Bill`

This code demonstrates the concept of variable scope in ruby. In this case that local variable initialized outside the scope of a block are accessible inside the block.

Time: 5:11
----------------------------
# Example 8
What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
--------------------
This example will throw an `NameError` on `line 10` because the local variable `var` is initialized inside the `do..end` block which alongside the loop method invocation creates its own scope. Therefore it is not accessible outside that scope and can't be used as an argument for the `puts` method on `line 10`.

This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized inside of a block is not accessible outside the block.

Time: 3:42
---------------------

