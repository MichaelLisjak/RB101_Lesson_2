=begin
'''
degree = angle.to_i
minute = (degree % 1) / 100 * 60
second = (minute % 1) * 60
'''

# cute angles
DEGREE = "\xC2\xB0"
def dms(angle)
  degree = angle.to_i
  minute = (angle % 1)  * 60
  second = (minute % 1) * 60
  format(%(%d#{DEGREE}%02d'%02d"), degree, minute, second)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

# delete vowels
=begin
def remove_vowels(arr)
  no_vowals = arr.map do |word|
    word.delete('aeiouAEIOU')
  end
  no_vowals
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

# fibonacci number location by length
=begin
def find_fibonacci_index_by_length(fibo_digits)
  fibonacci_arr = [1, 1]
  index = 1
  loop do
    fibonacci_arr << fibonacci_arr[index -1] + fibonacci_arr[index]
    index += 1
    break if fibonacci_arr[index - 1].to_s.size == fibo_digits
  end
  fibonacci_arr.size - 1
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end
=begin
# Reversed Arrays (Part 1)
'''
- initialize index variable with 1
- iterate through array until index = array.size / 2 
  - swap elements from (index - 1) with (-index)
  break if index = array.size / 2 
-return array
'''

def reverse!(arr)
  index = 1
  until index > arr.size / 2
    arr[index - 1], arr[-index] = arr[-index], arr[index - 1]
    index += 1
  end
  arr
end

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
reverse!(list) == [] # true
p list == [] # true
=end
=begin
# Reversed Arrays (Part 2)
'''
  - initialize an empty array for reversed list
  - initialize index variable with arr.size
  - iterate through given array, from last index to first while index > 0
    - copy the current element (arr[index -1]) into new reversed array
    - decrement index variable by 1
  - return reversed array


'''


def reverse(arr)
  reversed_arr = []
  index = arr.size
  while index > 0
    reversed_arr << arr[index -1]
    index -= 1
  end
  reversed_arr
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
=end
=begin
# Combining Arrays

def merge(arr1, arr2)
  combined_arr = arr1 + arr2
  combined_arr.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
=end
=begin
# Halvsies
'''
- initialize 2 empty arrays
- initialized odd_offset variable --> 0 if array.size.even?, otherwise 1
- iterate through given array with each_with_index
  - if element index < array.size / 2 + offset_var --> copy element to first array
  - else copy element to second array
- return an array with first and second array as subarrays
'''


def halvsies(arr)
  arr1 = []
  arr2 = []
  odd_offset = 0
  if arr.size.odd?
    odd_offset = 1
  end

  arr.each_with_index do |num, index|
    if index < (arr.size / 2) + odd_offset
      arr1 << num
    else
      arr2 << num
    end
  end
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
=end
=begin
# Find the Duplicate
'''
-create dup_num variable
-create empty array 
- iterate through given array
  - check if current element is included in new array
    - if so, copy that element into dup_num variable
      - break the iteration
  -  else copy current element into new array
return dup_num variable
'''


def find_dup(arr)
  dup_num = 0
  new_arr = []
  arr.each do |num|
    if new_arr.include?(num)
      dup_num = num
      break
    else
      new_arr << num
    end
  end
  dup_num
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

          
=end
=begin
# Does my list include this?

def include?(arr, element)
  includes = false
  arr.each do |e|
    if e == element
      includes = true
    end
  end
  includes
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false       
=end

# right triangles
'''
determine the number of total chars (space and *) --> the given argument
calculate number of spaces and * for every line
number of total lines = argument
#- create counter variable and initialize it with 1 (1* on first line)
- loop num-times
  - use times parameter i for calculating number of spaces and * (i + 1 --> *; num - (i + 1) --> spaces)
  - puts string according to that calculation with new line char at the end




'''


def triangle(num)
  num.times do |i|
    puts " " * (num - (i + 1)) + "*" * (i + 1)
  end
end

triangle(5)
triangle(9)