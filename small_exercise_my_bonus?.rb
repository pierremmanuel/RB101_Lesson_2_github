def calculate_bonus(salary, bonus)
  bonus == true ? (salary / 2) : 0
end

puts calculate_bonus(6540, false)
puts calculate_bonus(3000, true)
