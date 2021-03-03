# def digit_list(integer)
#   integer.digits
# end

# def digit_list(number)
#   number.to_s.chars.map{|char| char.to_i}
# end

def digit_list(number)
digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end
puts digit_list(456783)
