# Truthiness
This demonstrated the concept of truthiness is ruby, and that everything in ruby except for `nil` and `false` will evaluate to `true`
This code demonstrates the concept of truthiness in ruby, in this case the fact that `nil` evaluates to `false`

# Each, select, map

This example demonstrates that the `each` method does not care about the return value of its given block and always returns the array it is invoked on.

This code demonstrates that the `select` method only cares for the truthiness of what the block returns, and in this case, that `nil` evaluates to false in ruby.

This example demontrates that the `map` method performs transformation and will return a new array containing the return values of the block that is passed into it for every element it iterates through.

# Variable shadowing

This demonstrates variable shadowing. In this case the block parameter `n` prevents access to the outer local variable `n` from within the block because it has the same name.

# Local variable scope

This demonstrates that variable assignment is non-mutating and that reassignment merely points the variable to a different object.

This code example demonstrates variable assignment rules in ruby, specifically that reassigning a variable to a new object does not mutate the original object that the variable referenced before.

This example demonstrates the local variable scope of ruby and that local variables created in an inner scope cannot be accessed outside of that inner scope.

This example demonstrates the local variable scoping rules of ruby. In this case, that a local variable initialized in an outer scope can be accessed in an inner scope.

This example demonstrates the local variable scoping rules of ruby and that local variables that are initialized outside of a method have to be passed into the method as an argument in order to be accessible there.

The concept that this code demonstrates is that in order for local variables to be accessible inside a method, it has to be passed into it as an argument, because a method creates its own self-contained variable scope.

# Mutation

This example demonstrates mutability, and the fact that strings are mutable objects in ruby.

This example demonstrates mutability, in this case the original object has not been mutated because it has been reassigned first inside the method and therefore letting it point to a different object so the original object did not get mutated.

This code demonstrates that integer objects in ruby are immutable objects.

That code demonstrates that arrays can be mutated if element of the array are reassigned to different objects.

This example demonstrates that reassignment points a variable to a different object, and that any mutation that is performed on this new object, won't effect the object 
that the variable has previously referenced. 


# noch ergänzen?

# Object passing var as pointers

