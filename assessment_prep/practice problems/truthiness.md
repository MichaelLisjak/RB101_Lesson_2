# Example 1
What does the following code return? What does it output? Why? What concept does it demonstrate?
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

This code will return `nil` and output `Hello is truthy`

On `line 1` the local variable `a` is initialized with the string `Hello`
The `if` statement on `line 3` checks the variable `a` for truthiness and since everything in ruby except for `nil` and `false` are 
considered truthy, the `puts` method on `line 4` which takes the string `Hello is truthy` as an argument will be executed, and thus, that's what is outputed. 
`Puts` does always return `nil` so that's what this code returns.

This demonstrated the concept of truthiness is ruby, and that everything in ruby except for `nil` and `false` will evaluate to `true`

Time: 4:44
----------------------------------
# Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end

--------------------------------
This code will output `written assessment` and `interview` on two separate lines and return `nil`

`written assessment` will be output on `line 5` when the local variable `var` is initialized with what the method invocation of `test` will return. The method is defined on `line 1-3` and only consists of the `puts` method invocation which takes the string `written assessment` as an argument and returns `nil`

Since `var` is initialized with `nil` the `if.. else` statement on `line 7-11` will execute the `else` branch, because `nil` is evaluated to `false`
the `puts` method on `line 10` will then output `interview` and because it's the last line of code that is executes, the return value from `puts` which is `nil` is what the code returns.

This code demonstrates the concept of truthiness in ruby, especially the fact that `nil` evaluates to `false`

Time: 6:18

--------------------------
On `line 1-3` the method `test` which doesn't take any parameters is defined. It includes only the `puts` method which takes the string `written assessment` as an argument.

On `line 5` when the local variable `var` is initialized, it will be assigned to the return value of the `test` method invocation which is `nil` since that is what the `puts` method inside the `test` method returns

When the `if..else` statement on `line 7-11` is evaluated, the else branch will be executed, since `var` points to the `nil` object which evaluated to `false`
The `else` branch consists of the `puts` method which takes the string `interview` as an argument, and therefore outputs `interview` and returns `nil`

Since the method invocation of `test` on line 5 already outputs `written assessment` and the `puts` method on `line 10` outputs `interview`, those two strings are outputed on separate lines. The `puts` method on `line 10` is the last line of code that is executes and since `puts` always returns `nil` that is what the code returns.

This code demonstrates the concept of truthiness in ruby, and in that case that `nil` evaluates to `false`

Time: 8:12
----------------------------------------------------