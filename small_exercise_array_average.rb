def average(array)
  sum = 0
  for i in 0...(array.size) do
    sum += array[i]
  end
  sum.to_f / (array.size).to_f
end

p average([3,5,6,8])

# array = [9,4,8]
# puts array.size
# sum = array[0] + array[1] + array[2]
# puts sum
