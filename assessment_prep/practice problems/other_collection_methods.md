# Example 1
[1, 2, 3].any? do |num|
  num > 2
end
-----------------
On `line 1` the `any?` method that is invoked on the array [1, 2, 3] takes a block which takes `num` as a parameter and consists of the statement `num > 2`. 
The `any?` method will iterate over the array it is invoked on and pass every element of the array into the block through the parameter `num`.
Inside the block the expression `num > 2` will return true for any element that is greater than 2.
Because the integer element `3` is included in the array, the block will return true for this value and because the `any?` method will return true if the block 
returns true for any of the element, that is what the method returns.

This example demonstrates that the `any?` method returns true if the given block evaluates to true for at least one of the elements it is iterating over.
-----------
# Example 2
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
----------------------
On `line 1` the `any?` method is invoked on the hash `{ a: "ant", b: "bear", c: "cat" }`, taking a block in which every key and value of the hash the `any?` method is iterating through will be passed into the block.
Inside the block the method `size` is invoked on `value` returning the size of the value element of the hash. If the size is greater than 4 this block will return true, otherwise it will return false. Because no value in this hash has a size greater than 4, the expression `value.size > 4` will always evaluate to `false`, and because the `any?` method will also return `false` unless the block returns `true` for at least one element, it will return false in this case.

This example demonstrates that the `any?` method returns true only if the given block evaluates to true for at least one of the elements it is iterating over.
------------------------
# Example 3
[1, 2, 3].all? do |num|
  num > 2
end
---------------------------


