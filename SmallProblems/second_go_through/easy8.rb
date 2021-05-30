=begin
# sum of sums
'''
- create result variable and initialize it with 0
- create total variable and initialize it with arr.size
- loop total times
  - sum up all elements of the array and add it to result
  - delete the last element of the array
- return result



'''
def sum_of_sums(arr)
  result = 0
  total_times = arr.size
  total_times.times do |_|
    result += arr.sum
    arr.pop
  end
  result
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
=end
=begin
# madlibs

def madlibs
  puts "Enter a noun:"
  noun = gets.chomp
  puts "Enter a verb:"
  verb = gets.chomp
  puts "Enter an adjective:"
  adjective = gets.chomp
  puts "Enter an adverb:"
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?"
end

madlibs

=end
=begin
# leading substrings
'''
- create an empty array
- counter initialized with 0
- loop str.size.times 
  - write parts of the string into the array as an element from index 0 to index counter
  - increment counter by 1
return the array
'''
def leading_substrings(str)
  arr = []
  str.size.times {|n| arr << str[0..n]}
  arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
=end
=begin
# all substrings
'''
- create empty result arr
- loop str.size.times
  - pass the string going from 0...str.size as starting index to str.size into the leading_substrings method
  - add return array to result array
- return result array flattened
'''
def leading_substrings(str)
  arr = []
  str.size.times {|n| arr << str[0..n]}
  arr
end

def substrings(str)
  arr =[]
  str.size.times do |n|
    arr += leading_substrings(str[n..str.size])
  end
  arr.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end
=begin
# palindromic substrings

def leading_substrings(str)
  arr = []
  str.size.times {|n| arr << str[0..n]}
  arr
end

def substrings(str)
  arr =[]
  str.size.times do |n|
    arr += leading_substrings(str[n..str.size])
  end
  arr.flatten
end

def palindromes(str)
  arr = substrings(str)
  arr.select { |sub_str| (sub_str == sub_str.reverse) && sub_str.size > 1}
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
=end
=begin
# fizzbuzz
'''
  - create array with elements going from start to end
  - iterate through array
  - print out FizzBuzz if element % 3 == 0 && element % 5 == 0
  - print out Fizz if element % 3 == 0
  - print out Buzz if element % 3 == 0
  - else print out element 
'''
def fizzbuzz(start, ending)
  result = []
  (start..ending).to_a.each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << "#{num}"
    end
  end
  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
=end

# double char (part1)
=begin
'''
- create an empty array
- separate string into array, with every element of the array, being a char of the string
- iterate through the array, and put twice the char into a new array (map)
- join the array together to a string

'''

def repeater(str)
  doubled = []
  doubled = str.chars.map do |char|
    char * 2
  end
  doubled.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
=end

# double char (part 2)
=begin
'''
- create an empty array
- separate string into array, with every element of the array, being a char of the string
- iterate through the array (map)
  - if char is a vowels --> return just the char itself
    --> string of vowels: if that includes the char, then true
  - else return twice the char
- join the array together to a string
'''

def double_consonants(str)
  doubled = []
  doubled = str.chars.map do |char|
    if "bcdfghjklmnpqrstvwxyz".include?(char.downcase)
      char * 2
    else
      char
    end
  end
  doubled.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
=end
=begin
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
=end

'''
- create variable for string size
- find out if string length is odd or even
- if odd, middle char is string.size / 2
- if even, middle chars would be string.size -1 + string.size
- return middle part  
'''

def center_of(str)
  if str.size.odd?
    str[str.size / 2]
  else
    str[(str.size / 2 - 1)..str.size / 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'