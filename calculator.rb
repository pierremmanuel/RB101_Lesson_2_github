num1 = nil
num2 = nil
operation = nil

loop do
  Kernel.puts("Please enter two different numbers")
  num1 = Kernel.gets().chomp()
  num2 = Kernel.gets().chomp()
  break if num1.to_i.to_s == num1 && num2.to_i.to_s == num2
  Kernel.puts("You have to use valid numbers")
end

loop {
  Kernel.puts("What kind of operation do you want to perform? Enter 'add', 'substract', 'multiply' or 'divide'")
  operator = Kernel.gets().chomp()
  operator = operator.downcase
    case operator
      when "add"
        Kernel.puts("The result of #{num1} + #{num2} is #{num1.to_i + num2.to_i}")
        break
      when "substract"
        Kernel.puts("The result of #{num1} - #{num2} is #{num1.to_i - num2.to_i}")
        break
      when "multiply"
        Kernel.puts("The result of #{num1} * #{num2} is #{num1.to_i * num2.to_i}")
        break
      when "divide"
        if num2.to_i == 0
          Kernel.puts("You cannot divide by 0")
        else
          Kernel.puts("The result of #{num1} / #{num2} is #{num1.to_f / num2.to_f}")
          break
        end
      else
        Kernel.puts("You did not pick a valid operator")
    end
}
