=begin
# searching 101
numbers = []
5.times do |n|
  puts "Enter number #{n + 1}:"
  numbers << gets.chomp.to_i
end

puts "Enter last number:"
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end
=end
=begin
# arithmetic integer

puts "Enter the first number:"
num1 = gets.chomp.to_i
puts "Enter the second number:"
num2 = gets.chomp.to_i

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"
=end
=begin
# Counting the number of characters

puts "Please write a word or multiple words: "
words = gets.chomp

puts "There are #{words.delete(' ').size} characters in #{words}"
=end

# multiplying two numbers
=begin
def multiply(num1, num2)
  num1 * num2
end

p multiply([5, 4, 3], 3) #== 15


# squaring an argument
def square(num, power)
  multiply(num, 1) ** power
end
=end
=begin
# exclusive or

def xor?(arg1, arg2)
  if arg1 && !arg2
    true
  elsif !arg1 && arg2
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
=end

# odd lists
=begin
def oddities(arr)
  new_arr = []
  arr.each_with_index do |x, i|
    new_arr << x if i.even?
  end
  new_arr
end

def oddities(arr)
  index = -1
  arr.select do |n|
    index += 1
    index.even?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
=end

# palindromic string (part 1)
=begin
def palindrome?(text)
  text == text.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([3,5,6,6,5,3]) == true

def real_palindrome?(text)
  new_text = text.chars.select do |x|
    /[[:alnum:]]/.match(x)
  end
  new_text = new_text.join.downcase
  palindrome?(new_text)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
=end

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

p 001000.to_s