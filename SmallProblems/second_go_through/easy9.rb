=begin
# Welcome stranger

def greetings(arr, hsh)
  puts "Hello #{arr.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=end
=begin
# double doubles
'''
  - return the doubled number if 
      --> odd number of digits
      --> left half of digits and right half of digits are not the same
  - otherwise just return the number itself

  - convert integer to string and determine its size and save it to a variable
  - if the size is even, split it in the middle
  - compare both strings, and if they are equal, return the original number
  - if size is odd, or both strings are not equal, return the integer * 2
'''


def twice(num)
  num_size = num.to_s.size
  left = ''
  right = ''
  if num_size.even?
    left = num.to_s[0..(num.to_s.size / 2 -1)]
    right = num.to_s[num.to_s.size / 2..-1]
  end

  if num.to_s.size.odd? || left != right
    num * 2
  else
    num
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
=end
=begin
# always return negative

def negative(num)
  if num > 0
    - num
  else
    num
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
=end
=begin
# counting up

def sequence(num)
  numbers = []
  1.upto(num){ |n| numbers << n }
  numbers
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
=end
=begin
# uppercase check
'''
- split string into array
- iterate through that array
  - check if char == char.downcase
  - if that is the case for any of those chars, then return false
  - otherwise return true

'''
def uppercase?(str)
  str.chars.all? { |c| c == c.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
=end
=begin
# how long are you?
'''
  - separate string into array of words
  - iterate through array
    - map the word + "word.size" to array
  return array
'''
def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
=end
=begin
# name swapping
'''
- split string into array with first and last name
- return a new string, with both names swapped and comma appended to last name
'''
def swap_name(str)
  str_arr = str.split
  "#{str_arr[1]}, #{str_arr[0]}"
end


p swap_name('Joe Roberts') == 'Roberts, Joe'
=end
=begin
# sequence count
'''
- create empty array for return value
- loop count-times
  - multiply first number times current iteration number and add it to array
return array
'''
def sequence(count, first_num)
  seq_arr = []
  count.times do |i|
    seq_arr << (i + 1) * first_num
  end
  seq_arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
=end
=begin
# grade book

'''
- create average variable and initialize it with average value of the 3 given grades
- make case statement and return the appropriate grad
'''

def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  case average
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
=end
=begin
# grocery list
'''
  - create a new empty array for the result grocery list 
  - iterate through the given array of sub-arrays
    - loop subarray.last times
      - append subarray.first to result array
  - return result grocery list
'''

def buy_fruit(grocery_list)
  single_item_list = []
  grocery_list.each do |sub_arr|
    sub_arr.last.times { single_item_list.append(sub_arr.first) }
  end
  single_item_list
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end
=begin
# group anagrams
'''
- anagrams if word.chars.sort are equal

- initialize empty array for all the sub arrays
- iterate through given word array
  - for every word, find all the other words in the array with the exact same chars and save them to an array 

  - add that array to an other array as a sub_arr

  - remove the duplicate sub_arrays from that array
    - iterate through the array 
      - sort each sub_array alphabetically
    - then call uniq! method on array to remove all the duplicate sub arrays

  - print out every sub array of array
'''

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']


def group_anagrams(words)
  result_arr = []
  words.each do |word|
    sub_arr = []
    words.each do |word2|
      if word.chars.sort == word2.chars.sort
        sub_arr << word2
      end
    end
    result_arr << sub_arr
  end
  result_arr.uniq.each { |sub_arr| p sub_arr}
end

group_anagrams(words)
=end
