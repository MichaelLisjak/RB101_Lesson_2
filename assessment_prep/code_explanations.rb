'''
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
'''
'''
on line 1 the variable a is initialized with the integer value 4

on line 3 the loop method is invoked and the do..end block is passed in as an argument

on line 4 the variable a is reassigned a new object which is an integer with the value 5
on line 5 the variable b is initialized with the integer value of 3
on line 6 the break keyword exits the loop

on line 9 the method puts is called with the variable a passed in as an argument. The integer value 5 which is assigned to the variable a is output and nil is returned by the method puts
on line 10 an error is raised saying the local variable b is undefined. That is because variable b is initialized within the scope of the do..end block and is therefore not accessible outside of this scope,
  while is, is defined
'''

'''
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
'''

'''


'''
'''
def str 
  "a method"
end
'''
#p str # printing out the return value of the method invocation
'''
##############################
# play around with this method a little bit to grasp a better understanding 
def amethod(param) # param = str param is assigned to str at this point
  #param += " world" # param = param + " world" --> reassignment
  #param =  param + " world" # + is a non-destructive method. Could be written as param.+(" world")
  param << " world"
end

str = "hello"
amethod(str)

p str

###########################

a = "hello"
b = a
a << " world"

p a 
p b

def prefix(str)
  "Mr. " << str
end

name = "joe"
prefix(name)

puts name
'''

a = "hi there"
b = a
a = "not there" # string has the same value, but it is a different object as shown below

p b
p a.object_id
p b.object_id
'''
'''
'''
a = [1, 2, 3, 3]
b = a
c = a.uniq!
p b
p c
'''



arr = (1..10).to_a

incremented = arr.map do |n|
  n > 1
end # first element false, the rest true

hithere = arr.map do |n|
  "hi" # will return an array full of "hi" since the block returns hi
end

p hithere

hsh = {a: 1, b: 2, c: 3}

arr << hsh
p arr

hsh[:d] = 4 # hash also an object? hash modified here? arr modified here?? # array element an object?

p arr

a = 2
b = [5, 'hi'] # variable b is initialized with an array containing 2 elements?
arr = [a, b] # variable arr is initialized with an array countaining 2 elements referenced by variable a and b? 
p b.object_id
arr[0] += 2 # the valie of a didn't change because we are not referencing a at any point. This code arr[0] += 2 was modifying the array, arr not a. In effect we are assigning a new object at that index of the 
            # array so that instead of arr[0] containing a it now contains 4 # --> good enough or do I have to go as far as to say the array arr at index 0 contains the object that variable a is referencing?
arr[1][0] -= a # b = [3, 8] the first element of the array the variable b is referencing is reassigned to a new object with the value of 3 therefore b is mutated and referencing the same array [3, 8]
p b.object_id
b[1] << ' there!'
p b.object_id
b = [2, 3, 4]
p b.object_id 


# Cdoe snippets
#--------------------
a = "hi"
b = " there"
c = "hello"


c << a << b


p a 
p b
p c

#What does this code output and why?
# -------------------------
arr = [1, 2, 3]

odd_numbers = arr.map do |num|
  num.odd?
end

p odd_numbers

# What does this code output and why?
# ---------------------------
arr = [1, 2, 3]

new_arr = arr.map do |num|
  p num.to_s * 2
end

p new_arr
# ------------------------------
arr = [1, 2, 3]

arr.each do |num|
  num += 1
end

# what does this code output and why?
# --------------------------
a = "hello"

b = "world"

b << b + a

p a 
p b 

# what does this output and why?
# ---------------------------------
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(list)
  hsh = {}
  list.each_with_object(hsh) do |type, hsh|
    hsh[type] = list.count(type)
  end
  hsh.each { |type, count| puts "#{type} => #{count}" }
end

count_occurrences(vehicles)
# why is the outer hash variable hsh accessible although the block parameter is calles hsh as well? 
# Why does this not prevent the local variable from the outer scope to be accessed within the block?
# ------------------------------------------
5.times do |a|
  puts a
end

# what does this code output and return? Why?
# ------------------------------------------

fruits = ['strawberries', 'apples', 'pears', 'figs', 'raspberries', 'peaches']

p (fruits.sort_by do |a|
  puts a if a[-7..-1] == 'berries'
  a[1..-1]
end)

#What does this code output and return and why?
# ------------------------------------------------------------