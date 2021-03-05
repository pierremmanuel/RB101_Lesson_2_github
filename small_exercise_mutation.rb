array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }

array1.push("Bob")
p array1
p array2
array1.map { |value| value.upcase! if value.start_with?('C', 'S') }
p array1
p array2
