# ascii string value
=begin
def ascii_value(str)
  sum = 0
  str.chars.each {|c| sum += c.ord}
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
=end

# after midnight part 1
'''
variables:
  minutes_from_midnight # 0-59
  hours_from_midnight # 0- 24
  total_hours # 0-X
  total_minutes # 0-59

calculation:
  total_hours =  num / 60
  total_minutes = num % 60

if positive:
  hours_from_midnight = total_hours % 24
  minutes_from_midnight = total_minutes
if negative:
  hours_from_midnight = 24 - total_hours % 24
  minutes_from_midnight = 60 - total_minutes

  format hours and minutes to 2 decimals and output them
'''
=begin
def time_of_day(num)
  minutes_from_midnight = 0 # 0-59
  hours_from_midnight = 0 # 0- 24
  total_hours = 0 # 0-X
  total_minutes = 0 # 0-59

  total_hours = num.abs / 60
  total_minutes = num.abs % 60
  
  if num >= 0
    hours_from_midnight = total_hours % 24
    minutes_from_midnight = total_minutes
    sprintf("%02d:%02d",hours_from_midnight, minutes_from_midnight)
  elsif num < 0
    hours_from_midnight = 23 - total_hours % 24
    minutes_from_midnight = 60 - total_minutes
    sprintf("%02d:%02d",hours_from_midnight, minutes_from_midnight)
  end  

end
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
=end
=begin 
# after midnight part 2
'''
extract hours and minute values from string
variables:
hours_from_midnight
minutes_from_midnight

calculation:
  after_midnight:
    (hours_from_midnight % 24) * 60 + minutes_from_midnight

  before_midnight
    24 - (hours_from_midnight % 24) * 60 + (59 - minutes_from_midnight)
'''
def hours_and_minutes(time_str)
  time_arr = []
  time_arr = time_str[0..1].to_i, time_str[3..4].to_i 
end

def after_midnight(time_str)
  time_arr = hours_and_minutes(time_str)
  (time_arr[0] % 24) * 60 + time_arr[1]
end

def before_midnight(time_str)
  time_arr = hours_and_minutes(time_str)
  ((after_midnight(time_str) -1440).abs) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
=end

# letter counter (part 1 & 2)

=begin
def word_sizes(txt)
letter_count_hsh = Hash.new(0)
txt.delete!("^a-zA-z", "^ ")
txt.split.each do |word|
  letter_count_hsh[word.size] += 1
end
letter_count_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

#p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
#p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
#p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
#p word_sizes('') == {}
=end

=begin
# alphabetical numbers
NUMBERS = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }
def alphabetic_number_sort(arr)
  arr.sort_by! do |num|
    NUMBERS[num]
  end
arr
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

# Bannerizer

def print_in_box(txt)
  puts "+-" + "-" * txt.size + "-+"
  puts "| " + " " * txt.size + " |"
  puts "| #{txt} |"
  puts "| " + " " * txt.size + " |"
  puts "+-" + "-" * txt.size + "-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')