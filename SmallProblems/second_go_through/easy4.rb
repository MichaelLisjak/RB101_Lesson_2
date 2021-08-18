=begin
def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=end
=begin
def century(year)
  if year % 100 != 0
    century_int = (year / 100) + 1
  else
    century_int = (year / 100)
  end

  century = century_int.to_s
  if century.to_s[-1] == '1' && century.to_s[-2] != '1'
    century_int.to_s + 'st'
  elsif century.to_s[-1] == '2' && century.to_s[-2] != '1'
    century_int.to_s + 'nd'
  elsif century.to_s[-1] == '3' && century.to_s[-2] != '1'
    century_int.to_s + 'rd'
  else
    century_int.to_s + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
=end
=begin
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 4 == 0 && year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
=end

# multiples of 3 and 5
=begin
def multisum(num)
  num_arr = (1..num).to_a
  sum_arr = num_arr.select { |n| n % 3 == 0 || n % 5 == 0 }
  sum_arr.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
=end
=begin
# running total

#def running_total(arr)
  #sum = 0
  #total_arr = arr.map { |n| sum += n }
#end

def running_total(arr)
  sum = 0
  arr.each_with_object([]) { |n, running| running << sum += n}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
=end

# convert a string to a number!

def string_to_integer(str)
  
end