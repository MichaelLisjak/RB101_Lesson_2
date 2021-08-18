'''
Problem: write a method that returns true if integer argument is palindromic, false otherwise
data:
input: positive integer
output: boolean

algorithm:
-convert input into a string 
- use palindromic method from before

'''
=begin
def palindromic_number?(num)
  palindrome?(num.to_s)
end

def palindrome?(string)
  string == string.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
=end
#p 000123.to_s(8) # --> returns "123"

