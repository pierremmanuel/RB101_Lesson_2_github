# puts ">> Please enter an integer greater than 0:"
# integer = gets.chomp.to_i
#
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# operator = gets.chomp
#
# if operator == 's'
#   # sum = (1..integer).inject{|sum, number| sum + number}
#   sum = (1..integer).inject(&:+)
#   puts "The sum of the integers between 1 and #{integer} is #{sum}."
# elsif operator == 'p'
#   product = (1..integer).inject(&:*)
#   puts "The product of the integers between 1 and #{integer} is #{product}."
# else
#   puts "You did not pick a valid operator."
# end

# second method:
def sum_or_product_result(letter, integer)
  operation = (letter == 's') ? ("sum") : ("product")
  operator = (letter == 's') ? (:+) : (:*)
  result =  (1..integer).inject(&operator)
  "The #{operation} of the integers between 1 and #{integer} is #{result}."
end

puts ">> Please enter an integer greater than 0:"
integer_choice = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator_choice = gets.chomp

puts sum_or_product_result(operator_choice, integer_choice)
