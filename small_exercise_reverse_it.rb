def reverse_sentence(string)
  reversed_array =[]
  array = string.split
  while array[0]
    reversed_array.push(array.pop)
  end
  reversed_array.join(' ')
end

p reverse_sentence("Reverse these words!!")
