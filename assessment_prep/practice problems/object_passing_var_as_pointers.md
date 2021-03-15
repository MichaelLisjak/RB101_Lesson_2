# Example 1

a = "hi there"
b = a
a = "not here"

# What does the following code return? What does it output? Why? What concept does it demonstrate?
# What are a and b?
------------------------------------------------------------

this code doesn't output anything since the local variables `a` and `b` are only initialized and variable `a` is reassigned but they are never used.

if you would add the line `puts a` and `puts b` however, these lines would output
`puts a` # => `'not there'`
`puts b` # => `'hi there'`

but method invocations would return `nil`

the reason is that the local variable `a` on `line 1` is initialized with the string `'hi there'`, but since it is reassigned on `line 3` with the string `'not there'` this is what the `puts` method outputs

local variable `b` on `line 2` is initialized with the same string that variable `a` is pointing to which is `"hi there"`, and since it is never reassigned, that is what the `puts` method on `line 5` outputs