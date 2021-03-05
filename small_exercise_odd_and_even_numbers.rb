for i in 1..99
  puts i if i.odd?
end

# OTHER METHODS

# 1.step(to: 99, by: 2) {|number| puts number}

# 100.times do |num|
#   puts num if num.odd?
# end

# (1..99).each {|number| puts number if number.odd? }

# 1.upto(99) {|number| puts number if number.odd?}

# puts (1..99).select(&:odd?)

# value = 1
# while value <= 99
#   puts value
#   value += 2
# end

# printing even numbers
puts (1..99).select(&:even?)
