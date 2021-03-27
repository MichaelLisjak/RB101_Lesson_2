# Example 1
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

What does the following code return? What does it output? Why? What concept does it demonstrate?
---------------------
On `line 1` the local variable `a` is initialized with the integer `4`
On `line 2` the local variable `b` is initialized with the integer `2`

The `do..end` alongside the `times` method invocation on `line 4-6` creates a block which takes a parameter `a`.
Because it has the same name as the local variable initialized on `line 1` it prevents access to this variable and instead use the element that 
is passed into the block by the method invocation of `times` onto the integer `2`. Inside the block it will be reassigned to `5` and passed into the `puts` method 
as an argument and will therefore be outputed two times on separate lines.

The `puts` method invocation on `line 9` which takes `a` as an argument will output `4` and return `nil` because the local variable `a` of the outer scope has never been reassigned and is still pointing to `4`
The `puts` method invocation on `line 10` which takes `b` as an argument will output `2` and return `nil` for the same reason.

This demonstrates variable shadowing. In this case the block parameter `a` prevents access to the outer local variable `a` from within block because it has the same name.

Time: 11:58 
---------------------------
# Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?
n = 10

1.times do |n|
  n = 11
end

puts n
--------------------
On `line 1` the local variable `n` is initialized with the integer `10`.
The `do..end` alongside the `times` method invocation on the integer `1` on `line 3-5` creates a block which takes a parameter `n`.
Inside the block `n` is reassigned to the integer `11`. Because `n` is the name of the block parameter it will use the element that is passed into the block from the `times` method invocation and not the local variable from the outer scope. 

Because the variable `n` from the outer scope is not reassigned it is still referencing the interger `10` and this is what the `puts` method invocation that takes `n` as 
an argument will output.

This demonstrates variable shadowing. In this case the block parameter `n` prevents access to the outer local variable `n` from within block because it has the same name.

Time: 5:28
---------------------
# Example 3
What does the following code return? What does it output? Why? What concept does it demonstrate?
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
--------------
On `line 1` the local variable `animal` is initialized with the string `dog`

The `do..end` alongside the `loop` method invocation on `line 3-6` creates a block which takes a parameter `animal`.
Inside the block `animal` is initialized with the string `cat`. Because `animal` is the name of the block parameter it will prevent the local variable from
the outer scope to be accessible inside the block so the variable `animal` inside the block is a new variable.

Because the variable `animal` from the outer scope is not reassigned it is still referencing the string `dog` and this is what the `puts` method invocation that takes `animal` as an argument will output.

Time: 4:40
-------------
On `line 1` the local variable `animal` is initialized with the string `dog`.
The `loop` method invocation on `line 3` takes a `do..end` block with a block parameter `animal`.

Because the block parameter has the same name as the local variable on `line 1`, this local variable `animal` will not be accessible inside the block and when 
the variable `animal` is used inside the block, it will refer to the block parameter instead.
Therefore on `line 4` the local variable `animal` from the outer scope is not reassigned with the string `cat` and the method call `puts` which takes `animal` as an argument will output `dog`

This demonstrates variable shadowing. In this case the block parameter `animal` prevents access to the outer local variable `animal` from within the block because it has the same name.
