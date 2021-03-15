# Example 5
What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)

What values do `s` and `t` have? Why?

`s` and `t` are both pointing to the string object `'axc'`

On `line 9` `s` is initialized with the string `'abc'`. On `line 10` the method `fix` is called, takes `s` as an argument and the variable `t` 
is inizialized with the return value of the method `fix`

The method `fix` is defined on `line 4 -7` and it takes one parameter `value`
When the string object `s` is pointing to is passed into the method on `line 10` the variable `value` inside the method is then also referencing this string object
On `line 5` the `[]=` method is called on value and it reassigns the string character on index `1` to the string with the value `'x'`
The method `fix` does return that string because it is the last line of code on `line 6` that is executed inside the method, and therefore local variable `t` on `line 10` is initialized with that value

This code demonstrates that string objects are mutable and can be modified with methods like `string#[]=` which is reassigning parts of the string it is invoked on with a new string.

# Notes: []= --> called "Element Assignment", mentioned in lesson 4.2
Time: 8:45