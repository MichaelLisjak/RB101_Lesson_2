# 2nd to the last

'''
input: string
output: string 

rules: output string is the input string with the 2nd to the last letter of any letter that occurs more than once in the string upcased

algo:
- create result_array -answer-
- split string into array of letters (str_arr)
- create an extra array (duplicates) with all the letters of the string that occur more than once
    - iterate through str_arr and select all the letters that occur more than once (str_arr.select { count...}) and save them in duplicates
- iterate through str_arr with each with index
    - if letter is in duplicate list AND str_arr[index..-1].count(current_letter) == 2 --> upcase letter and append it to answer array
    - else (letter is not included in duplicate list)  --> append letter to answer array
- join answer array to a string and return it
'''

def second_to_the_last(str)
    answer = []
    str_arr = str.chars
    duplicates = str_arr.select { |letter| str_arr.count(letter) > 1}.uniq
    str_arr.each_with_index do |letter, index|
        if duplicates.include?(letter) && str_arr[index..-1].count(letter) == 2
            answer << letter.upcase
        else
            answer << letter
        end
    end
    answer.join
end

p second_to_the_last("hunchbunch") == "hUNCHbunch" 
p second_to_the_last("looptool") == "LooptOol"
p second_to_the_last("bb") == "Bb"
p second_to_the_last("abcdabcd") == "ABCDabcd"
p second_to_the_last("adrian") == "Adrian"

# test for git
