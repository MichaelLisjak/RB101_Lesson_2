=begin
# Rotation (part 1)
'''
  arr[1..-1] + arr[0]
'''

def rotate_array(arr)
  arr[1..-1].append(arr[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
=end
=begin
# Rotation (part 2)
'''
- create an array with every element being a digit of the given number
- create 2 empty arrays called before and after
- split the array in a part before the rotation and after (before, after)
  - before: arr[0..-(start + 1)]
  - after: arr[(-start)..-1]
- put together before array + result of rotate_array(after)
- join array to string and convert it to an integer

'''
def rotate_array(arr)
  arr[1..-1].append(arr[0])
end

def rotate_rightmost_digits(number, start)
  arr = number.digits.reverse
  before = arr[0..-(start + 1)]
  after = arr[-start..-1]
  (before + rotate_array(after)).join.to_i
end
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
=end
=begin
# Rotation (part 3)
'''
1. rotate number [0..-1]
2. rotate number [1..-1]
3. rotate number [2..-1]
4. ...

1. take number and number.digits.size and provide it as argument for rotate rightmost digits
2. take return value of rotate rightmost digits and provide it and number.digits.size - 1 as argument for rotate rightmost digits...
3. ...

- initialize variable result with number
- initialize counter variable with number.digits.size

- loop until counter is 0, and decrement it with every iteration of the loop
  - call rotate_rightmost_digits with result, counter as arguments
  - save return value of the method call into variable result
  - decrement counter by 1
- return result

'''
def rotate_array(arr)
  arr[1..-1].append(arr[0])
end

def rotate_rightmost_digits(number, start)
  arr = number.digits.reverse
  before = arr[0..-(start + 1)]
  after = arr[-start..-1]
  (before + rotate_array(after)).join.to_i
end

def max_rotation(number)
  result = number
  counter = number.digits.size
  until counter <= 0 do
    result = rotate_rightmost_digits(result, counter)
    counter -= 1
  end
  result
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
=end
=begin
# 1000 lights
'''
Problem: go through a band of lightswitches and toggle the switch
1. every switch
2. switch 2,4,6...
3. switch 3,6,9...
- go through it n times, n being the number of lights
- return array with the numbers of the switches that are turned on after the last (n) go-through

- create an array, initialize it with n elements of boolean false
- counter variable initialized with 0
- create empty result array

- loop n-times
  - increment counter by 1
  - iterate through array by index using the counter variable (each with index)
    - if (index + 1) % counter == 0 --> toggle the boolean element

- iterate through boolean array (each_with_index)
  - if element is true --> append index + 1 to result array
- return result array

'''
def create_light_bank(num_of_lights)
  light_array = []
  num_of_lights.times { light_array << false}
  light_array 
end

def light_switch(num_of_lights)
  light_array = create_light_bank(num_of_lights)
  counter = 0
  result_arr = []
  num_of_lights.times do 
    counter += 1
    light_array.each_with_index do |n, i|
      if (i + 1) % counter == 0
        light_array[i] = !light_array[i] 
      end
    end
  end
  light_array.each_with_index do |n, i| 
    if n == true 
      result_arr << (i + 1)
    end
  end
  result_arr
end

p light_switch(5) == [1, 4]
p light_switch(10) == [1, 4, 9]
=end
#=begin
# diamonds!
'''
num lines
broadest line is num * long
every line is 9 chars long, consisting of spaces and *
- counter variable, initialized with 1
- loop num-times
  - print out a string of spaces and *
    - formula:
      (num - counter) / 2 spaces; 
      counter-*
    - if counter < num
      counter += 2
    - else 
      counter -= 2
'''
def print_line(num, counter)
  puts ("*" * counter).center(num)
end

def diamond(num)
  counter = 1
  increasing = true
  num.times do |n|
    print_line(num, counter)
    if increasing == true  
      counter += 2
      if counter >= (num)
        increasing = false
      end
    else
      counter -= 2
    end
  end
end

diamond(1)
diamond(3)
diamond(9)
#=end
=begin
# word to digit

'''
- create a hash with keys being the string names for the number and the value being the actual number as a string e.g. "five" => "5"
- iterate through that hash, gsub the key with its value in the string

'''
NUMBERS = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
            'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

def word_to_digit(str)
  NUMBERS.each do |key, value|
    str.gsub!(key, value)
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
=end

