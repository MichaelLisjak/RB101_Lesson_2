# combine two lists
=begin
def interleave(arr1, arr2)
  combined_arr = []
  arr1.size.times do |i|
    combined_arr << arr1[i]
    combined_arr << arr2[i]
  end
  combined_arr
end
=end
=begin
# alternative solution with array#zip
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end

# lettercase counter
=begin
'''
- create a hash with 3 keys for lower-, uppercase, and neither and initialize their values with 0
- iterate through the string characters
  - if char compared with char.downcase is true, but compared with upcase its false --> char is lowercase
    - increment hash value of key lowercase by 1
  - elsif char compared with char.upcase is true, but compared with downcase its false --> char is uppercase
    - increment hash value of key lowercase by 1
  - else it is neither
    - increment hash value of key neither by 1
- return hash
'''

def letter_case_count(str)
  hsh = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    if char == char.downcase && char != char.upcase
      hsh[:lowercase] += 1
    elsif char != char.downcase && char == char.upcase
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
=end
=begin
# capitalize words

def word_cap(s)
  s.split.map(&:capitalize).join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
=end
=begin
# swap case

def swapcase(str)
  str.chars.map do |char|
    if char == char.downcase && char != char.upcase
      char.upcase
    elsif char != char.downcase && char == char.upcase
      char.downcase
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
=end
=begin
# staggered caps (part 1)

def staggered_case(str)
  staggered_str = ''
  str.chars.each_with_index do |letter, index| letter.swapcase
    if index.odd? 
      staggered_str << letter.downcase
    else
      staggered_str << letter.upcase
    end
  end
  staggered_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=end
=begin
# staggered caps (part 2)
'''
- create updown variable and initialize it with true
- create empty string
- iterate through the given string char by char
  - if updown variable is true, upcase the char, if it is false, downcase the char
    - add char to string
  - if char is an alphabetic character, toggle the updown variable
'''

def staggered_case(str)
  staggered_str = ''
  updown = true
  str.chars.each do |char|
    if updown
      staggered_str << char.upcase
    else
      staggered_str << char.downcase
    end
    if char =~ /[a-zA-Z]/  #'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(char)
      updown = !updown
    end
  end
  staggered_str
end
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end

=begin
# multiplicative average

def show_multiplicative_average(arr)
  result = (arr.inject { |sum, n| sum * n} / arr.size.to_f).round(3)
  puts "The result is #{format('%.3f' ,result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
=end
=begin
# multiply list

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub_arr| sub_arr.reduce(:*)} 
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
=end
=begin
# multiply all pairs
'''
- create empty array called results
- iterate through first array
  - iterate through second array, multiplying each element with the element of the first array and save it in results
- sort the array in ascending order and return it
'''


def multiply_all_pairs(arr1, arr2)
  results = []

  arr1.each do |n1|
    arr2.each do |n2|
      results << n1 * n2
    end
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
=end

# the end is near but not there

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'