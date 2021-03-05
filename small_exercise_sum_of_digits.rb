def sum(integer)
  integer.digits.reduce(:+)
end

puts sum(4567)

# def sum(integer)
# array = []
#   loop do
#   integer, remainder = integer.divmod(10)
#   array.unshift(remainder)
#   break if integer == 0
#   end
# array.reduce(:+)
# end

# def sum(number)
#   sum = 0
#   str_digits = number.to_s.chars
#
#   str_digits.each do |str_digit|
#     sum += str_digit.to_i
#   end
#
#   sum
# end

# def sum(number)
#   number.to_s.chars.map(&:to_i).reduce(:+)
# end

p sum(456_987)
