def repeat(str, num)
  num.times {puts str}
end

repeat('Hello', 3)

# on line 5 the method repeat is called with two arguments, the string 'hello' and the integer 3
# inside the method definition of repeat, we invoke the times method on the num argument. The block that
# is passed to the times method is executed 3 times in our case since that's the argument passed into the method for num.
# the puts method outputs the string 'hello' and returns nil. Since that block is executed 3 times, the string "Hello is output 3 times"