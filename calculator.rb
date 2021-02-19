def prompt(message)
  Kernel.puts("=> #{message}")
end

def operation_to_message(op)
  case op
  when "1"
    return "Adding"
  when "2"
    return "Subtracting"
  when "3"
    return "Multiplying"
  when "4"
    return "Dividing"
  else
    return
  end
end

prompt("Welcome to calculator! Enter your name")
name = nil
loop {
  name = Kernel.gets().chomp()
  if name.empty?
    prompt("Make sure to write your name!")
  else
    break
  end
}

prompt("Hi #{name}!")

num1 = nil
num2 = nil
loop {
  loop {
    prompt("Please enter two different numbers...")
    num1 = Kernel.gets().chomp()
    num2 = Kernel.gets().chomp()
    break if num1.to_i.to_s == num1 && num2.to_i.to_s == num2
    prompt("You have to use valid numbers")
  }

  operator_prompt = <<-blabla
    What operation would you like to perform #{name}?
    1) add
    2) substract
    3) multiply
    4) divide
  blabla
  prompt(operator_prompt)

  operator = nil
  loop {
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("You have to pick a number between 1 and 4")
    end
  }

  prompt("#{operation_to_message(operator)} the two numbers")

  case operator
    when "1"
    prompt("The result of #{num1} + #{num2} is #{num1.to_i + num2.to_i}")
    when "2"
    prompt("The result of #{num1} - #{num2} is #{num1.to_i - num2.to_i}")
    when "3"
    prompt("The result of #{num1} * #{num2} is #{num1.to_i * num2.to_i}")
    when "4"
      if num2.to_i.zero?
        prompt("You cannot divide by 0, do it again")
        next
      else
        prompt("The result of #{num1} / #{num2} is #{num1.to_f / num2.to_f}")
      end
    else
    prompt("You did not pick a valid operator, do it again")
    next
  end

  prompt("Do you want to do another operation? Yes / No")
  answer = Kernel.gets().chomp().downcase
  break if answer == "no"
}
