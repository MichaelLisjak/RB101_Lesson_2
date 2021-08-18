# Example 1
What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
What values do `s` and `t` have? Why?
----------------------------
On `line 1-3` the method `fix` is defined and takes one parameter `value`.
On `line 7` the local variable `s` is initialized with the string `hello` and is then passed into the method invocation of `fix` as 
an argument on `line 8`

When `s` is passed into the method, the parameter `value` will point to a copy of the reference of the object that `s` is referencing, in that
case to the string `hello`.

Inside the method, first the `upcase!` method is invoked on the string, mutating it and upcases all the letters so it will now be `HELLO`.
Then the `concat` method is invoked on the string, taking `!` as an argument concatenating the `!` so it will now be `HELLO!` and will be returned by the method `fix`.

Because the local variable `t` is initialized with the return value of the method invocation of `fix` it will point to `HELLO!` just like the local variable `s` does.

This example demonstrates mutability, and the fact that strings are mutable objects in ruby.
-------------------------
# Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
What values do `s` and `t` have? Why?
----------------------
On `line 1-4` the method `fix` is defined and takes one parameter `value`.
On `line 6` the local variable `s` is initialized with the string `hello` and is then passed into the method invocation of `fix` as 
an argument on `line 8`.
There `value` will point to a copy of the reference of the object that `s` is referencing, in that
case to the string `hello`. On `line 2` the method `upcase` is invoked on `value` and the return value is reassigned to `value`, making it reference a new string
`HELLO` now. The mutating method `concat` is then invoked on `value` and takes a string `!` as an argument and mutates it so that it concatinates `!` to `HELLO`.
Because `value` has been reassigned inside the method before any mutation has taken place, `s` is still referencing its original string `hello`, while `value` is now referencing `HELLO!`. Since this is returned by the method `fix`, and the local variable `t` is initialized with this return value, this is what `t` is referencing now.

This example demonstrates mutability, in this case the original object has not been mutated because it has been reassigned first inside the method and therefore letting it point to a different object so the original object did not get mutated.
------------------------
# Example 3
What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

What values do `s` and `t` have? Why?
-------------------------
On `line 1-5` the method `fix` is defined and takes one parameter `value`.
On `line 7` the local variable `s` is initialized with the string `hello` and is then passed into the method invocation of `fix` as 
an argument on `line 8`.
There `value` will point to a copy of the reference of the object that `s` is referencing, in that
case to the string `hello`.
Inside the method the `<<` method is invoked on value and takes the string `xyz` as an argument, effectively appending it to the string `hello`, so at this point
`s` is referencing `helloyxz`
On `line 3` the method `upcase` is invoked on `value` and the return value is reassigned to `value`, making it reference a new string
`HELLOXYZ` now. The mutating method `concat` is then invoked on `value` and takes a string `!` as an argument and mutates it so that it concatinates `!` to `HELLOXYZ`.
This is what the method invocation of `fix` returns on `line 8` and what is therefore assigned to the local variable `t`

After the code is executes `s` will reference the string `helloyxz` and `t` will reference the string `HELLOXYZ!`.

this example demonstrates mutability, and in that case, that string objects are mutable in ruby.

------------------------
# Example 4
What does the following code return? What does it output? Why? What concept does it demonstrate?
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)

What values do `s` and `t` have? Why?



------------------------------
# Example 5
What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
What values do `s` and `t` have? Why?
--------------------------------

On `line 9` the local variable `s` is initialized with the string `abc`. On `line 10` `s` is is then passed into the `fix` method as an argument, and the variable `t` is then initialized with the return value of the `fix` method. 
The `fix` method is defined on `line 4-7` and takes one parameter `value`
When `a` is passed into the method on `line 10` the method `[]=` is then called on its element index `1` and replaces the current string value `b` with `x` and therefore mutates the string object that `a` and `value` are pointing to. 
Since value is the last line of code in the method `fix` this is what is returned and therefore the variable `t` on `line 10` is initialized with `axc`.
So both variables `s` and `t` are referencing the same string object `axc`. 

This code demonstrates that string objects can be mutated. 

Time: 6:45
--------------------------------


`s` and `t` are both pointing to the string object `'axc'`

On `line 9` `s` is initialized with the string `'abc'`. On `line 10` the method `fix` is called, takes `s` as an argument and the variable `t` 
is inizialized with the return value of the method `fix`

The method `fix` is defined on `line 4 -7` and it takes one parameter `value`
When the string object `s` is pointing to is passed into the method on `line 10` the variable `value` inside the method is then also referencing this string object
On `line 5` the `[]=` method is called on value and it reassigns the string character on index `1` to the string with the value `'x'`
The method `fix` does return that string because it is the last line of code on `line 6` that is executed inside the method, and therefore local variable `t` on `line 10` is initialized with that value

This code demonstrates that string objects are mutable and can be modified with methods like `string#[]=` which is reassigning parts of the string it is invoked on with a new string.
------------------------------------
# Notes: []= --> called "Element Assignment", mentioned in lesson 4.2
Time: 8:45
-----------------------------------
# Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
---------------------------------
On `line 1-3` the method `a_method` is defined and takes one parameter `string`.
On `line 5` the local variable `a` is initialized with the string `hello` and is then passed into the method invocation of `a_method` as 
an argument on `line 6`.
There `string` will point to a copy of the reference of the object that `a` is referencing, in that
case to the string `hello`.

Inside the method the `<<` method is invoked on `string` an takes the string ` world` as an argument, which is therefore appended to `hello`.

Effectively the string `a` and `string` are referencing is mutated and has the value `hello world` now. This is what will be outputed and returned by the `p` method invocation on `line 8` where `a` is passed into as an argument.

This code demonstrates mutability, in that case that strings are mutable objects in ruby.
---------------------------------
# Example 7
What does the following code return? What does it output? Why? What concept does it demonstrate?
num = 3

num = 2 * num
----------------------
On `line 1` the local variable `num` is initialized with the integer `3`
On `line 3` `num` is reassigned with the value it is referecing multiplyed by `2`, and therefore now referencing the integer value `6`

This code demonstrates that integer objects in ruby are immutable objects.
-------------------------------------
# Example 8
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = %w(a b c)
a[1] = '-'
p a
--------------------
On `line 1` the local variable `a` is initialized with an array of three string elements `a`, `b` and `c`.
On `line 2` the array element with the index `1` is reassigned to a new string value `-`, effectively mutating the array that `a` is referencing.

That's why the `p` method invocation on `line 3` that takes `a` as an argument will output the string `['a', '-', 'c']`

That code demonstrates that arrays can be mutated if element of the array are reassigned to different objects.
# Notes: The "that code demonstrates part is correct? 
----------------
# Example 9
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
-------------------
On `line 1-3` the method `add_name` is defined and takes two parameters `arr` and `name`.
On `line 5` the local variable `names` is initialized with the array `['bob', 'kim']` and is then passed into the method invocation of `add_name` as 
an argument on `line 6` along with the second argument being the string `jim`.
Inside the method `arr` will point to a copy of the reference of the array object that `names` is referencing.
On `line 2` `arr` will be reassigned with the array it is referecing itself plus the string object `jim` added as an array object.
Because the resulting array is returned by the method but never used, the original array that `names` is referencing is never mutated and therefore, when
`puts` is invoked on `line 7` taking `names` as an argument, the orignal array `['bob', 'kim']` will be outputed. 

This example demonstrates that reassignment points a variable to a different object, and that any mutation that is performed on this new object, won't effect the object 
that the variable has previously referenced. 
----------------------
# Example 10
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
---------------------
On `line 1-3` the method `add_name` is defined and takes two parameters `arr` and `name`.
On `line 5` the local variable `names` is initialized with the array `['bob', 'kim']` and is then passed into the method invocation of `add_name` as 
an argument on `line 6` along with the second argument being the string `kim`.

inside the method the `<<` method is invoked on arr and takes `name` as an argument, effectively appending the string `jim` as an element to the array that `arr` is referencing`.

Because this mutates the array that `arr` is referencing, the array will now be `['bob', 'kim', 'jim']` and therefore the puts method on `line 7` that takes `names` as an argument will output the 3 elements `bob`, `kim` and `jim` on separate lines.

This example demonstrates mutation, and in this case that string objects are mutable objects in ruby.
-----------------------










