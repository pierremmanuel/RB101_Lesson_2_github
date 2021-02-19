def prompt(message)
  Kernel.puts("=> #{message}")
end

num1 = nil
num2 = nil

prompt("Welcome to calculator!")

loop {
  loop {
    prompt("Please enter two different numbers")
    num1 = Kernel.gets().chomp()
    num2 = Kernel.gets().chomp()
    break if num1.to_i.to_s == num1 && num2.to_i.to_s == num2
    prompt("You have to use valid numbers")
  }

  loop {
    prompt("What kind of operation do you want to perform? 1) add 2) substract 3) multiply 4) divide")
    operator = Kernel.gets().chomp().downcase

      case operator
      when "add"
      prompt("The result of #{num1} + #{num2} is #{num1.to_i + num2.to_i}")
      break
      when "substract"
      prompt("The result of #{num1} - #{num2} is #{num1.to_i - num2.to_i}")
      break
      when "multiply"
      prompt("The result of #{num1} * #{num2} is #{num1.to_i * num2.to_i}")
      break
      when "divide"
        if num2.to_i.zero?
          prompt("You cannot divide by 0")
          next
        else
          prompt("The result of #{num1} / #{num2} is #{num1.to_f / num2.to_f}")
          break
        end
      else
          prompt("You did not pick a valid operator")
          next
      end
    }

  prompt("Do you want to do another operation? Yes / No")
  answer = Kernel.gets().chomp().downcase
  break if answer == "no"
}

prompt("Thank you for using the calculator! Good Bye!")
