require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'fr'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts ("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
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

name = nil
prompt(messages('welcome', LANGUAGE))
loop {
  name = Kernel.gets().chomp()
  if name.empty?
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
}

puts "=> " + messages('hello', LANGUAGE) + name +"!"

num1 = nil
num2 = nil
loop {
  loop {
    prompt(messages('number_entry', LANGUAGE))
    num1 = Kernel.gets().chomp()
    num2 = Kernel.gets().chomp()
    break if number?(num1) && number?(num2)
    prompt(messages('wrong_numbers', LANGUAGE))
  }

  # operator_prompt = <<-MSG
  #   What operation would you like to perform?
  #   1) add
  #   2) substract
  #   3) multiply
  #   4) divide
  # MSG

  prompt(messages('select_operation', LANGUAGE))

  operator = nil
  loop {
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('wrong_operation', LANGUAGE))
    end
  }

  case operator
    when "1"
      prompt(messages('one', LANGUAGE))
      prompt(messages('result', LANGUAGE))
      print "#{num1.to_i + num2.to_i}"
    when "2"
      prompt(messages('two', LANGUAGE))
      prompt(messages('result', LANGUAGE))
      print "#{num1.to_i - num2.to_i}"
    when "3"
      prompt(messages('three', LANGUAGE))
      prompt(messages('result', LANGUAGE))
      print "#{num1.to_i * num2.to_i}"
    when "4"
      prompt(messages('four', LANGUAGE))
      if num2.to_i.zero?
        prompt(messages('zero_division', LANGUAGE))
        next
      else
        prompt(messages('result', LANGUAGE))
        puts "#{num1.to_i / num2.to_i}"
      end
  end

  prompt(messages('continue', LANGUAGE))
  answer = gets.chomp.downcase
  break if answer == "no" || answer == "non"
}
