=begin
# Sum of digits
def sum(num)
  num.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end
=begin
# array average
def average(arr)
  (arr.sum) / (arr.size)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
=end
=begin
# stringy strings
def stringy(num, start = 1)
  out_str = start.to_s
  (num - 1).times do
    out_str[-1] == '1' ? out_str << '0' : out_str << '1' 
  end
  out_str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'
=end
=begin
# what's my bonus?
def calculate_bonus(salary, bonus)
  bonus ? salary * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
=end

