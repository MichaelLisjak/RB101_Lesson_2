- On `lines 1–8` we are defining the method `example` which takes 1 parameter

- Use "evaluates to true" or "is truthy" when discussing an expression that evaluates to true in a boolean context
- Do not use "is true" or "is equal to true" unless specifically discussing the boolean true

- The do..end alongside the loop method invocation on lines 3 to 6 defines a block

Essentially the block acts as an argument to the method. In the same way that a local variable can be passed as an argument to a method at invocation, when a method is called with a block, the block acts as an argument to that method.

In both of the above examples, the method definition is such that the method has a parameter str. This allows the method to access the string "Hello" since it is passed in as an argument at method invocation in the form of the local variable word

local variables that are initialized in an inner scope CAN’T be accessed in the outer scope, but local variables that are initialized in the outer scope CAN be accessed in an inner scope.

use markdown for lines `line 4` method names `each`, `do end` blocks, variable and objects, also integers `5`

------------------------------------------------------------
Example from Study guide with perfect answer:

Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

D) The local variable `greeting` is assigned to the String `'Hello'` on line 1. The `do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block, within which `greeting` is reassigned to the String `Hi` on `line 4`. The `puts` method is called on line 8 with the variable `greeting` passed to it as an argument; since `greeting` is now assigned to `'Hi'`, this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

Personal notes on this example: `greeting` mentioned as local variable once, the next time it's just variable `greeting` or even just `greeting` is assigned to `'Hi`
the `puts` method is called with the variable `greeting` passed to it as an argument

[]= # Element Assignment
------------------------------------------------------------

integers are non mutable
reassignemnt is non-destructive
-------------------
# if..else

on line x-y we have an if statement

the `if branch` is executes
or the `else branch` is executes
the `condition provided to the if statement`

every `expression` evaluates to/as true when used in a `condition`
---------------------

- a = false # a references the `boolean` false

The block is the do...end, and the block parameter is captured between the | symbols. In the above example, the block parameter is n, which represents each element as the each method iterates through the array.

# variable shadowing Lesson 2, 18. Variable scope
But what if we had a variable named n in the outer scope? We know that the inner scope has access to the outer scope, so we'd essentially have two local variables in the inner scope with the same name. When that happens, it's called `variable shadowing`, and it prevents access to the outer scope local variable
The puts n will use the block parameter n and disregard the outer scoped local variable. Variable shadowing also prevents us from making changes to the outer scoped n:

Which of the following behaviors does ruby exhibit when passing an object as an argument to a method call?
--> When an object is passed to a method call as an argument, the parameter assigned to it acts as a pointer to the original object.


# look up:
String interpolation with #{}

`<<` method `appends`
--------------
# Passing into Methods
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
# Passed into method
When `y` is passed into the method, inside the method `x` will get a copy of the reference of the object that `y` is referencing, in that
case to the string `a`. The `<<` method that is invoked on `x` takes the string `b` as an argument and appends it to the string `a`, effectively mutating the string
`x` is and `y` are referencing. Therefore the `puts` method invocation on `line 8` which takes `y` as an argument will output `ab` and return `nil`.
----------------
# Variable shadowing
The `do..end` alongside the `loop` method invocation on `line 3-6` creates a block which takes a parameter `animal`.
Inside the block `animal` is initialized with the string `cat`. Because `animal` is the name of the block parameter it will prevent the local variable from
the outer scope to be accessible inside the block so the variable `animal` inside the block is a new variable.

Because the variable `animal` from the outer scope is not reassigned it is still referencing the string `dog` and this is what the `puts` method invocation that takes `animal` as an argument will output.