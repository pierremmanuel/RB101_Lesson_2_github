require 'date'

puts "What's your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

today = Date.today.year
years_left = retire_age - age

puts "It's #{today}. You will retire in #{today + years_left}."
puts "You have only #{years_left} years of work to go!"
