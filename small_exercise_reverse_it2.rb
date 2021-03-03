# def reverse_words(string)
#   array = string.split
#   reversed_array = []
#   for i in 0..(array.size - 1)
#     if array[i].length < 5
#       reversed_array.push(array[i])
#     else
#       reversed_array.push(array[i].reverse)
#     end
#   end
#   reversed_array.join(' ')
# end
#
# puts reverse_words("Bonjour tout le monde!")


def reverse_words(string)
  array = string.split
  rev_array = []
  for i in 0..(array.size - 1)
    array[i].length < 5 ? rev_array.push(array[i]) : rev_array.push(array[i].reverse)
  end
  rev_array.join(' ')
end

puts reverse_words("Bonjour tout le monde!")
