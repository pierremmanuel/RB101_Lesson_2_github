# def stringy(integer)
#   array = []
#   integer.times do
#     if array.size % 2 == 0
#       array.push('1')
#     elsif array.size % 2 == 1
#       array.push('0')
#     end
#   end
#   array.join
# end
#
# p stringy(8)

def stringy(integer, start_number = 1)
  array = []
  integer.times do
    if start_number == 1
      array.size.even? ? array.push('1') : array.push('0')
    else
      array.size.even? ? array.push('0') : array.push('1')
    end
  end
  array.join
end

p stringy(8, 0)
