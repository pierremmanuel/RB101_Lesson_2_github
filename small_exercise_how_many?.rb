def count_occurrences(array)
  occurrences = {}
  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end
  
  return occurrences
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

puts count_occurrences(vehicles)
