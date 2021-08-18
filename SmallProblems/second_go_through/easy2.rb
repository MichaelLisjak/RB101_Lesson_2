=begin
# how old is teddy?
def how_old(name = 'Teddy')
  puts "#{name} is #{rand(20..200)} years old"
end

how_old
how_old('Michael')
=end
=begin
# how big is the room?
puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

square_meters = length * width
square_feet = square_meters * 10.7639
puts "The area of the room is #{square_meters} square meters (#{square_feet.round(2)} square feet)."
=end
=begin
puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip = (bill * tip_percentage) / 100
total = bill + tip

puts "The total is %0.2f" %[tip]  #"The tip is #{tip}"
puts "The total is %0.2f" %[total] # "The total is #{total}"
=end
=begin
# When will I retire?
require 'date'

puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Date.today.year
retire_year = current_year + (retire_age - age)

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{retire_year - current_year} years of work to go!"
=end
=begin
# greeting a user
puts "What is your name?"
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name[0..-2].upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end
=end
=begin
# odd numbers
1.upto(99) { |num| p num if num.odd?}
=end
=begin
# sum or product of consecutive integer
puts "Enter integer greater 0:"
num = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
op = gets.chomp
num_arr = (1..num).to_a
case op
when 's' 
  p num_arr.inject { |sum, n| sum += n}
when 'p' 
  p num_arr.inject { |product, n| product *= n}
end
=end



