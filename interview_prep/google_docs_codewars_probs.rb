=begin
--------------------------1. Count letters in string------------------------------
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

create empty hash with the values initialized with 0
string.char.each --> iterate through every letter of the string
  increment the value of corresponding letter of the key
return the hash

=end
=begin
def letter_count(str)
  letter_hsh = Hash.new(0)
  str.chars.each do |letter|
    letter_hsh[letter.to_sym] += 1
  end
  letter_hsh
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

=begin
---------------------------------2. Find all pairs-------------------------------------

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

-create array with unique values of given array
-initialize pair counter variable with 0
- iterate through the unique array, and use element to count occurences of that number in original array
  - if count returns 2 or greater, increment pair counter
-return pair counter

=end
=begin
def find_all_pairs(arr)
  pair_count = 0
  0.upto(1000) do |num| 
    if arr.count(num) > 1
      pair_count += arr.count(num) / 2
    end
  end
  pair_count
end

p find_all_pairs([1, 2, 5, 6, 5, 2])
p find_all_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
=end

=begin
-----------------------------------------3. Return substring instance count------------------------------------
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaacbbbccc', 'bbb') # should return 1

iterate through the string and look at a substring of the length of given string to search for
counter = 0
times = 0
loop through string starting at 0..1..2..3... counter
  if first substring_size letters are equal to substring then times += 1
  counter += 1

=end
=begin
def solution(str, sub_str)
  counter = 0
  times = 0
  loop do
    if str[counter..(counter + sub_str.size - 1)] == sub_str
      times += 1
    end
    counter += 1
    
    break if counter == str.size - (sub_str.size - 1)
  end
  times
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
=end

=begin
---------------------------------4. Alphabet symmetry-------------------------------------------
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Good luck!

-create a hash with letters as keys and its position in the alphabet as values
-counter variable for correct positions
-interate through given array
  -initialize counter with 0
  -iterate through current element converted to array with index
    -if element lowercased matches its corresponding keys value in the hash, increment counter by 1
  -add counter to result array as an element

=end
=begin
def create_hash()
  alphabet_str = "abcdefghijklmnopqrstuvwxyz"
  counter = 1
  alphabet_hsh = {}
  alphabet_str.chars.each_with_object(alphabet_hsh) do |letter, hsh|
    alphabet_hsh[letter] = counter
    counter += 1
  end
  alphabet_hsh
end

def solve(arr)
  result_arr = []
  alphabet_hsh = create_hash()
  arr.each do |word|
    counter = 0
    word.downcase.chars.each_with_index do |letter, index|
      if index + 1 == alphabet_hsh[letter]
        counter += 1
      end
    end
    result_arr << counter
  end
  result_arr
end

p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
=end

=begin
-------------------------5. Longest vowel chain--------------------------------------
The vowel substrings in the word codewarriors are o,e,a,io. 
The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, 
return the length of the longest vowel substring. Vowels are any of aeiou.

- replace all non-vowel characters with whitespace
- split the string into substrings forming an array, with every element being a substring of only vowels
- create an array with all the lengths of the subarrays
- return the highest length from that array

=end
=begin
def solve(str)
  str.gsub!(/[^aeiou]/, ' ')
  str_arr = str.split(' ')
  str_arr.map! { |letter| letter.size}.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
=end

=begin
---------------------------6. Non-Even Substrings--------------------------------------
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.


-create an array with all the possible substrings of given string
  -start with substring size 1 and iterate through string and write those substrings into array until iteration index + substringsize == string size
  -increase substring size by 1 and repeat until substring size == string size
  
-iterate through array (map)
  -converting every substring to an integer number
-iterate through integer array again 
  -check if the number is odd, then keep it, otherwise delete it (map!)
-count elements of the integer array and return it

=end
=begin
def solve(str)
  substr_arr = []
  substr_size = 0
  loop do
    str.chars.each_with_index do |_, index|
      if index + substr_size < str.size
      substr_arr << str[index..(index + substr_size)]
      end
    end
    substr_size += 1
    break if substr_size > str.size
  end
  substr_arr.map!{ |num| num.to_i}
  substr_arr.select{ |num| num.odd?}.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
=end

=begin
--------------------------------7. Substring fun-----------------------------------------
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.
=end
=begin
def nth_char(arr)
  result = ''
  arr.each_with_index { |word, index| result << word[index] }
  result
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
=end

=begin
----------------------------8. Repeated Substring------------------------------------
For a given nonempty string s find a minimum substring t and the maximum number k, 
such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. 
Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:

for string

s = "ababab"
the answer is

["ab", 3]
Example #2:

for string

s = "abcde"
the answer is

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
=end
=begin
'''
input: non-empty string
output: array with 2 elements, first being the minimal substring, last being the number of times that substring is required to form the original string

algo:
- create method for leading substrings
- create method for substrings
- create all possible substrings
- create all possible solution arrays with substring and number of repeated times
- determine the array with minimum substring and maximum number of times


'''
def leading_substrings(str)
  sub_arr = []
  str.size.times { |n| sub_arr << str[0..n]}
  sub_arr
end

def substrings(str)
  sub_arr = []
  str.size.times { |n| sub_arr += leading_substrings(str[n..str.size])}
  sub_arr
end

def f(str)
  answer = ['', 0]
  sub_arr = substrings(str).sort_by {|sub| sub.size}.uniq
  sub_arr.each do |substring|
    complete_substring = ''
    until complete_substring.size >= str.size do
      complete_substring += substring
    end
    if complete_substring == str
      answer[0] = substring
      answer[1] = str.size / substring.size
      break
    end
  end
  answer
end



p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
=end
# ---------------------------------------------9.Typoglycemia Generator------------------------------------------------------

=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long 
as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separatedseperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia
=end
=begin
'''
input: string of words
output: string of words with first and last letter staying in place, and the other letters being sorted alphabetically (hint: non-alpha chars stay where they are)
- handling the middle part: separate helper method
  - find index of special char and save it into a variable   
  - sort the middle part alphabetically
  - insert first element of the array(which is the special char) at the index it used to be
  - delete first element of array
  - return middle part array


algo:
- create variable for first letter
- create variable for last letter
- create variable for special char
- create array for middle part 
- split the string into an array with every word being an element of the array
- interate through the array (map)
  - split word into array of chars
  - handle middle part
  - put array back together and join it to string word
- join array together to a string and return it

'''
def get_index(arr)
  index = 0
  arr.each_with_index do |c, i|
    if ['.', ',', '-', "'"].include?(c)
      index = i
    end
  end
  index
end

def handle_middle_part(arr)
  index = get_index(arr)
  arr.sort!
  arr.insert((index + 1), arr[0])
  arr.delete_at(0)
  arr
end

def scramble_words(str)
  arr_str = str.split
  arr_str.map! do |word|
    word_arr = word.chars
    if word_arr.size <= 1
      word_arr = word.chars
    elsif ['.', ',', '-', "'"].include?(word[0])
      word_arr = [word[0]] +[word[1]] + handle_middle_part(word[2..-2].chars) + [word[-1]]
    elsif ['.', ',', '-', "'"].include?(word[-1])
      word_arr = [word[0]] + handle_middle_part(word[1..-3].chars) + [word[-2]] + [word[-1]]
    else
      word_arr = [word[0]] + handle_middle_part(word[1..-2].chars) + [word[-1]]
    end
    word_arr.join
  end
  arr_str.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
=end

#--------------------------------------14. Dubstep-----------------------------------------------
=begin
  6 kyu
Polycarpus works as a Dhttps://www.codewars.com/kata/551dc350bf4e526099000ae5/train/rubyJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND
=end
=begin
def song_decoder(str)
  str.gsub('WUB',' ').strip.squeeze(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
=end
# ----------------------------------------- 15. Take a Ten Minute Walk------------------------------------------------
=begin
6 kyu
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).
=end
=begin
def is_valid_walk(arr)
  arr.count('n') == arr.count('s') && arr.count('w') == arr.count('e') && arr.size == 10 ? true : false
end



p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
=end
=begin
#-----------------------------------------------------16. Stop gninnipS My sdroW!---------------------------------------------------------------
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=end
=begin
'''
- split string into array of words
- iterate through words
  - if word.size < 5 return word itself
  - else put together the word like this: word[0] + word[1..-2].reverse + word[-1] and return it
- join array together to string and return it
'''

def spinWords(string)
  string.split().map! { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"
=end
=begin
#--------------------------------17. Write Number in Expanded Form-----------------------------------------
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!
=end
=begin
'''
input: integer greater 0
output: string

- split integer number into digits.
- create an array with all the expanded numbers:
  - multiply digits with 10^index
  - if number > 0 --> append it to the integer array
- reverse array

- create exp_num_str, initialize it with "#{arr[0]} "
- iterate arr.size - 1 times and add "+ #{arr[n + 1]} to exp_num_str
- return exp_num_str
'''

def expanded_form(num)
  num_arr = [] 
  num.digits.each_with_index do |digit, index|
    if digit > 0
      num_arr << digit * 10**index
    end
  end
  num_arr.reverse!

  exp_num_str = "#{num_arr[0]}"
  (num_arr.size - 1).times { |n| exp_num_str += " + #{num_arr[n + 1]}" }
  exp_num_str
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
=end
=begin
#------------------------------------------18. Persistent Bugger---------------------------------------------------------
6 kyu
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number
=end
=begin
'''
input: a positive integer
output: a positive integer
rules: output is number of times I have to multiply the individual digits of the given number, to get it down to 1 digit

algo:
- initialize counter variable with 0
- create variable for return value of current_num and initialize it with given argument
- loop until current_num < 10
  - break down current_num to its digits, multiply them, and return the result to current_num
    - use inject method for the calculation
  - increment counter variable by 1
- return counter

'''

def persistence(num)
  counter = 0
  current_num = num
  until current_num < 10 do
    current_num = current_num.digits.inject(1){ |prod, n| prod * n }
    counter += 1
  end
  counter
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
=end
=begin
#------------------------------------------------------19. Title Case------------------------------------------------
(https://www.codewars.com/kata/5202ef17a402dd033c000009)
6 kyu
A string is considered to be in title case if each word in the string is either (a) capitalised 
(that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely 
into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). 
The list of minor words will be given as a string with each word separated by a space. 
Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.
=end
=begin
'''
input: one or two strings, first string should be made title case, second will be a list of exception words
output: the first input string in title case

rules: 
- first word is always title case, even if on exception list
- every other word is capitalized, UNLESS it is a word from the exception list string
- exception string is optional

algo:

- split title string and exception string down to arrays of words
- capitalize first array element of title string
- iterate through the rest of title array (map)
  - if the word is included in exception array (make comparison case insensitive!!) --> make it all downcase
  - else capitalize the word
- join array to string and return it 
'''

def title_case(title_str, exceptions = '')
  title_arr = title_str.split
  exceptions_arr = exceptions.downcase.split
  title_arr[0].capitalize!
  title_arr[1..-1].map do |word|
    if exceptions_arr.include?(word.downcase)
      word.downcase!
    else
      word.capitalize!
    end
  end
  title_arr.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
=end
=begin
#-------------------------------------20. Count and Group Character Occurrences in a String-----------------------------------------
(https://www.codewars.com/kata/543e8390386034b63b001f31)
6 kyu
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.
=end
=begin
'''
- initialize empty hash
- delete all non-alphabetic chars (split to array, then regexp.match(element) for select method)
-iterate through array
  - add hash key, value pair or add value if key already exists
'''

def get_char_count(str)
  hsh = Hash.new([])
  str.downcase!
  str_arr = str.chars
  str_arr = str.chars.select { |char| ('a'..'z').to_a.include?(char.downcase) || ('0'..'9').to_a.include?(char.downcase) }
  str_arr.sort!
  str_arr.each do |char|
    hsh[str_arr.count(char)] += [char.downcase]
  end
  hsh.values.map! {|value| value.uniq!}
  hsh.sort_by { |key, _| key}.reverse.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
=end
=begin
#---------------------------------------21. Find the Mine!---------------------------------------
(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
6 kyu
You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. 
Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array where the first element is the row index, and the 
second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), 
and there will only be one mine in the array.
=end
=begin
'''
[0, 0, 0], [0, 0, 0], [0, 1, 0]
-->
 0  1  2
[0, 0, 0] 0
[0, 0, 0] 1
[0, 1, 0] 2
--> answer: [2, 1]

input: array of arrays, with 0s and one 1 as elements
output: array with 2 elements, the first one being the row and the second one being the column of the mines location

rules: 
- always a square NxN
- exactly one mine
- 1 represents the mine, and 0 represents the rest

algo:
- find out two indexes: 
  - row: index of the subarray that contains the 1
  - column: index of element 1 of the subarray

- create two variables, row, and column
- iterate through array (each_with_index)
  - check if subarray includes 1
  - write index of that subarray into variable row
- find index of element 1 with subarray.index(1) and assign it to variable column
return [row, column]

'''

def mineLocation(minefield)
  row = 0
  column = 0

  minefield.each_with_index do |sub_arr, index| 
    if sub_arr.include?(1)
      row = index
    end
  end
  column = minefield[row].index(1)
  [row, column]
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
=end
=begin
#----------------------------------------22. Scramblies-----------------------------------------
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
=end
=begin
'''
idea:
- split both strings up into arrays of chars
- interate through second array
  - see if char is included in first array
    - if so, delete it from there
    - else --> return false

algo:
- split both strings into arrays and save them in a variable
- iterate through 2nd array
  - if char is included in first array
    - delete that char from first array
  - else return false
- return true
'''

def scramble(str1, str2)
  str_arr1 = str1.chars
  str_arr2 = str2.chars
  str_arr2.each do |char|
    if str_arr1.include?(char)
      str_arr1.each_with_index do |searched_char, index|
        if searched_char == char
          str_arr1.delete_at(index)
          break
        end
      end
    else
      return false
    end
  end
  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
=end
=begin
#-------------------------------------------23. Longest alphabetical substring------------------------------------------
(https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
6 kyu
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.
=end
=begin
'''
input: string
output: string: longest substring of input string, that is in alphabetical order

rules:
- only lowercase letters and at least 1 letter long
- if multiple solutions exist, return the first one that appears

algo:
- create an array with all the possible substrings of input string (helper method)
- delete all substrings that are not in alphabetical order (compare substring.chars with substring.chars.sort )
- find the longest substring of that array (#max with a block)

'''

def leading_substrings(str)
  sub_arr = []
  str.size.times { |n| sub_arr << str[0..n]}
  sub_arr
end

def substrings(str)
  sub_arr = []
  str.size.times { |n| sub_arr += leading_substrings(str[n..str.size])}
  sub_arr
end

def longest(str)
  sub_arr = substrings(str)
  sub_arr.reject! { |sub_str| sub_str.chars != sub_str.chars.sort}
  sub_arr.max { |a, b| a.length <=> b.length}
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
=end
=begin
24. The Hashtag Generator
(https://www.codewars.com/kata/52449b062fb80683ec000024)
5 kyu
=begin
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false
=end
=begin
'''
input: string
output: string in hash style, or boolean false

rules:
- if the string is empty or final result has more than 140 chars --> return false
- add # sign at the beginning
- capitalize every word
- delete every space in the string

algo:
- create return string variable hashtag and initialize it with "#"
- if string is empty --> return false
- create array with every word from input string being a word
- iterate through array, capitalize every word
- join array back together to string and append it to hashtag
- if hashtag.length <= 140 --> return hashtag
  otherwise return false
'''

def generateHashtag(str)
  hashtag = '#'
  return false if str.empty? || str.squeeze(' ').size < 2
  str_arr = str.split
  str_arr.map! { |word| word.capitalize}
  hashtag += str_arr.join
  if hashtag.length <= 140
    hashtag
  else
    false
  end
end



p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
=end

#------------------------------------------------- 27. Exponent method----------------------------------------------
=begin
Create a method called "power" that takes two integers and returns the value of the first argument raised 
to the power of the second. Return nil if the second argument is negative.

Note: The ** operator has been disabled.

Examples:
=end

=begin
'''
input: two integer values, can both be positive or negative
output: integer, pos. or neg., or nil

rules:
- return value is the first argument, to the power of the 2nd argument
- if 2nd argument is negative, return nil
- ** operator is disabled
- 2nd operator can be 0, but the first one can not


algo:
- initialize result variable with 1
- if power < 0
  - return nil
- elsif power == 0
  - return 1
- else
  - loop power times
    - multiply result with num and reassign it to result
- return result

'''

def power(num, power)
  result = 1
  if power < 0
    return nil
  elsif power == 0
    1
  else
    power.times { result *= num }
  end
  result
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
=end

#--------------------------------------------28. Where my anagrams at?----------------------------------------------
=begin
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. 
You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:
=end
=begin
'''
input: string, array of strings
output: array of strings, or empty array

rules: 
- it is an anagram if word from list countains the same letters than the word from the first argument
- return all the words from list that are anagrams of the first argument

algo:

- create an empty result array anagrams
- create array with sorted chars from the word of the first argument (sorted_word)
- iterate through array from the second argument
  - compare sorted_word with sorted array of chars of the current element of the array (word.chars.sort)
   - if the comparison returns true --> add word to result array
- return anagrams array
'''

def anagrams(ref_word, list_of_words)
  sorted_word = ref_word.chars.sort
  list_of_words.reject! do |word|
    sorted_word != word.chars.sort
  end
  list_of_words
end


p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
=end
=begin
29. Split Strings

Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').
=end
=begin
'''
input: string
output: array of strings with 2 letters each

rules:
- output array should contain the splitted version of the string
  - each element should be 2 chars from the original string
  - if string length is odd, the last element should have the final missing char replaced by an underscore

algo:
- create empty string results
- create counter variable initialize it with 0
- if str length is odd --> append underscore
- loop until counter + 2 > str. length
  - access fraction of 2 chars of the string via element reference [counter, 2] and add it to results
  - increment counter by 2
- return results

'''

def solution(str)
  results = []
  counter = 0
  if str.length.odd?
    str += '_'
  end
  until counter + 2 > str.length
    results << str[counter, 2]
    counter += 2
  end
  results
end 

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
=end
=begin
#---------------------------------------------30. Anagram difference---------------------------------------------------------
(https://www.codewars.com/kata/5b1b27c8f60e99a467000041)
6 kyu
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.
=end
=begin
'''
input: two strings
output: integer

rules:
- count the letters that have to be removed from the words to make them anagrams
- the total of the removed letters of both words
- anagram --> if both words contain the same letters
  
algo:
- create an array of letters for both of the words, and sort them alphabetically
- initialize result variable with 0

algo2:
- create result variable
- split string into array of words
- get array with all the letters that exist in both arrays
- get this arrays length and add it to results
- delete those from second string
- add the difference of second string length before deleting the letter and after deleting the letters to results
'''
=begin
def anagram_difference(str1, str2)
  smallest_common = str1.chars & str2.chars
  (str1.size - smallest_common.size) + (str2.size - smallest_common.size)
end
=end
=begin
def anagram_difference(string1, string2)
  same_chars_count = 0
  string1.chars.each do |char|
    if string2.include?(char)
      string2.sub!(char, '')
      #p char
      #p string2
      same_chars_count += 1
    end
  end
  #p string2
  string2.size + (string1.size - same_chars_count)
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
=end
=begin
#----------------------------------31. Anagram Detection----------------------------------------
(https://www.codewars.com/kata/529eef7a9194e0cbc1000255)
7 kyu
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"
=end


=begin
def is_anagram(str1, str2)
  str1.downcase.chars.sort == str2.downcase.chars.sort
end
p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
=end

=begin
#-----------------------------------------32. Highest Scoring Word-----------------------------------------------------------------
(https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)
6 kyu
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.
=end
=begin
'''
input: string of words
output: string (single word)

rules: 
- every word has a score depending on its letter
- the word with the highest score should be returned
- if two words score the same, return the word that appears earliert in the orig. string

algo:
- create helper method for calculating the score

- split up the input string into an array of words
- iterate through array and save all the scores into a score array
  - find the highest score of all the words in the array and save it in variable highscore
- iterate through that array and return the first word with that score
'''

def calculate_score(word)
  sum = 0
  word.chars.each { |char| sum += (char.ord() -96 ) }
  sum
end

def high(str)
  highscore = 0
  words = str.split(' ')
  # determine highest score of a word in the array
  words.each do |word|
    if calculate_score(word) > highscore
      highscore = calculate_score(word)
    end
  end
  # find the first word with the highest score and return it, in case there are more words with the same score
  words.each do |word|
    if calculate_score(word) == highscore
      return word
    end
  end
end


p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

=begin
#-----------------------------------33. Replace With Alphabet Position----------------------------------

In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
=end
=begin
'''
input: string
output: string, with the corresponding position of the letters in the alphabet

rules:
- replace the letter in the string with its position in the alphabet
- if it isnt a letter, ignore it
- position numbers in the output string are separated by a whitespace

algo:
- split the string into array of single chars
- create result array
- iterate through those chars
  - get the corresponding position in the alphabet of that letter
  - if valid letter, that is position range between 1 and 26 --> add to result array
- join the array together to a string, and return it

'''
def alphabet_position(str)
  result = []
  str.chars.each do |char|
    position = char.downcase.ord - 96
    if position >= 1 && position <= 26
      result << position
    end
  end
  result.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
=end

=begin
----------------------------------------------34. Sherlock on pockets--------------------------------------------------------------
(https://www.codewars.com/kata/53bb1201392478fefc000746)
6 kyu
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of 
numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.
=end
=begin
'''
input: hash pockets, with persons as key and an array as values, defining the objects in that persons pocket
output: array of persons (key), or nil

rules:
- return array of persons (key) which have an item in their pockets(values) that is not in the list of allowed items.
- if noone has any forbidden items in their pockets, return nil
- if array of allowed items is empty, any item in the persons pockets makes them a suspect

algo:
- create empty array suspects
- iterate through hash
  - iterate through value
    - if element is not included in list of allowed items --> add key to suspect array
      - break
- if suspect array is empty
  - return nil
- else
  return suspects
'''

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |person, items|
    items.each do |item|
      if allowed_items.include?(item) == false
        suspects << person
        break
      end
    end
  end

  if suspects.empty?
    nil
  else
    suspects
  end
end

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
=end
=begin
------------------------------------35. Mexican Wave----------------------------------------
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
 	1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
=end
=begin
'''
input: string
output: array of strings

rules:
- create an array of the same word repeated, but with every consecutive word having its next letter uppercased
- if there is a whitespace, skip that and do not count it as uppercased
- go through the word as many times as it has letters, so every letter is uppercased once

algo:
- create empty array mex_wave

- loop string.size times(n)
  - split the string into an array of chars
  - if array[n] != " "
    - upcase array[n]
    - join array together to a string
    - add that string to mex_wave
- return mex_wave
'''

def wave(str)
  mex_wave = []
  str.size.times do |n|
    str_arr = str.chars
    if str_arr[n] != ' '
      str_arr[n].upcase!
      mex_wave << str_arr.join
    end
  end
  mex_wave
end


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
=end
=begin
-----------------------------------------36. Delete a Digit---------------------------------------------
(https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)
6 kyu
Task
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer
=end

=begin
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
=end
=begin
-----------------------------------------39. Largest product in a series-------------------------------------------------
(https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
6 kyu
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.
=end
=begin
'''
input: string
output: integer

rules:
- return the greatest product of five concecutive digits
- input string always has more than 5 digits

algo:
- initialize counter variable with 0
- create empty array for all the products
- iterate through string, creating substrings of a length of five digits --> stop iterating when index + 5 >= string.length
  - start with index 0, and iterate through it incrementing index by 1
    - convert substring into an integer
    - split integer into array of digits
    - calculate the product of those digits
  - add that product to products array
  - increment counter variable by 1
- return the largest number of products array
'''

def calculate_product(str)
  if str[0] == '0'
    return 0
  end
  digits = str.to_i.digits.reverse
  digits.inject(1) { |product, num| product *= num}
end

def greatest_product(str)
  counter = 0
  products = []
  until counter + 5 > str.length
    products << calculate_product(str[counter, 5])
    counter += 1
  end
  products.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
=end
=begin
40. Duplicate Encoder
(https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby)
6 kyu
The goal of this exercise is to convert a string to a new string where each character in the new string is 
"(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. 
Ignore capitalization when determining if a character is a duplicate.

Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

=end
=begin
'''
input: string
output: string of parathesis

rule: 
- replace every char with a paranthesis
- replace it with ( if that char is unique in the string.
- replace it with ) if it is not unique
- ignore cases --> upper and lowercase letters count as duplicates
- whitespaces also count as a char

algorithm:
- downcase the whole string
- split string into an array of chars
- iterate through array of chars --> map
  - count the occurences of that char
    - if count is 1, replace it with (
    - else replace it with )
- join array back together to a string
- return the string
'''

def duplicate_encode(str)
  str.downcase!
  str.chars.map do |char|
    if str.count(char) == 1
      '('
    else
      ')'
    end
  end.join
end
p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

=end
=begin
---------------------------------------42. Sort Arrays (Ignoring Casehttps://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)---------------------------------
(https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)
6 kyu
Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]
=end
=begin
def sortme(arr)
  arr.sort_by {|word| word.downcase }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]
=end
=begin
43. Transform To Prime
(https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
6 kyu
Task :
Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples
1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , 
which will make *the sum of the List** equal the closest prime number (7)* .
2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , 
which will make *the sum of the List** equal the closest prime number (37)* .
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , 
which will make *the sum of the List** equal the closest prime number (191)* .
=end
=begin
'''
input: array of integers
output: integer

rules:
- output should be the minimum integer number that has to be added to the sum of the integers of the array, to make it a prime number
- array contains only positive numbers
- min. array size it 2

algorithm:
- calculate the sum of the given array and save it to a variable number
- loop 
  - check if current number is a prime number
  - if current number is prime number --> return it
  - else --> increment number by 1

'''
require 'prime'

def minimum_number(arr)
  number = arr.sum
  addition = 0
  loop do
    #number += addition
    if (number + addition).prime?
      return addition
    else
      addition += 1
    end
  end
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
=end
=begin
44. Counting Duplicates 
(https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end
=begin
'''
input: string
output: integer

rules:
- count the number of duplicates 
  - case-insensitive alphabetic chars or numeric digits
- duplicate is any char the occures more than once in the string
- string contains only alphabetic letters or numeric digits

algorithm:
- create counter variable for return value
- create array of letters from a to z and digits from 0 to 9
- iterate through the array
  - count the occurences of the current element of the array
    - if count is greater than 1 --> increment counter variable
- return counter variable
'''

def duplicate_count(str)
  str.downcase!
  counter = 0
  reference_array = ('a'..'z').to_a + ('0'..'9').to_a
  reference_array.each do |char|
    if str.count(char) > 1
      counter += 1
    end
  end
  counter
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
=end
=begin
----------------------------------------------45. Alphabetized----------------------------------------------------
(https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
6 kyu
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"
=end

'''

'''

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

