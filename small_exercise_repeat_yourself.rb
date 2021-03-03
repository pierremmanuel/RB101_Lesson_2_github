def repeat_yourself(string, i)
  counter = 0
  while counter < i
    puts string
    counter += 1
  end
end

repeat_yourself("Hello", 3)


# Alternative solution
# ------------------------------------------
# def repeat_yourself(string, number)
#     1.step(to: number, by: 1){puts string}
# end
#
# repeat_yourself("Hello", 3)
