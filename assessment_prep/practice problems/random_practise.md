What does the following code return? What does it output? Why? What concept does it demonstrate?
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

On `line 1` the local variable `a` is initialized with the integer `4`
On `line 2` the local variable `b` is initialized with the integer `2`

The `loop` method in `line 4` takes a `do..end` block which itself creates its own scope. Inside this block the local variable `c` is initialized with the integer `3`
and `a` is reassigned with that value on `line 6`.

Because `a` is now referecing the same integer value that `c` is referencing, which is `3`, this is what is outputed by the `puts` method on `line 10`, which takes `a` as an argument.
Since `b` is never reassigned it's still referencing the integer `2` and therefore, this is what the `puts` method invocation that takes `b` as an argument on `line 11` will output.

This example demonstrates the local variable scoping rules of ruby. In this case, that a local variable initialized in an outer scope can be accessed in an inner scope.
--------------------------
What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
--------------------------
On `line 1` the local variable `animal` is initialized with the string `dog`.
The `loop` method invocation on `line 3` takes a `do..end` block with a block parameter `animal`.

(Inside the block the local variable `animal` is initialized with the string `cat`, and because the variable 
name here has the same name as the block parameter, the block parameter shadows the local variable `animal` from the outer scope.)

(Inside the block, instead of reassigning the local variable `animal` from the outer scope, a new variable `animal` only accessible in the inner scope of the block
is initialized with the string `cat`. This is because the parameter of the block prevents accessibility of the outer variable `animal` inside the block.)

(Because the block parameter is also called `animal`, the local variable `animal` that is initialized with `cat` on `line 4` inside the block is not the same as the one initialized outside the block on `line 1`, the block parameter prevents the outer variable from being accessed inside the block.)

# Best solution I think
Because the block parameter has the same name as the local variable on `line 1`, this local variable `animal` will not be accessible inside the block and when 
the variable `animal` is used inside the block, it will refer to the block parameter instead.
Therefore on `line 4` the local variable `animal` from the outer scope is not reassigned with the string `cat` and the method call `puts` which takes `animal` as an argument will output `dog`

This demonstrates variable shadowing. In this case the block parameter `animal` prevents access to the outer local variable `animal` from within the block because it has the same name.
# improve --> Saying that the because the block parameter has the same name as the outer local variable, the outer variable `animal` cannot be accessed inside the block and the animal = `cat` is a different/new variable only accessible inside the block.
-------------------------


