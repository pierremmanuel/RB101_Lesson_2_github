require 'yaml'
MESSAGES = YAML.load_file('msgs_loan_calculator.yml')

def messages(key)
  MESSAGES[key]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(number)
  integer?(number) || float?(number)
end

prompt(messages('welcome'))

loop {
  loan_amount = nil
  prompt(messages('enter_loan'))
  loop do
    loan_amount = gets.chomp
    break if number?(loan_amount)
    prompt(messages('invalid_input1'))
  end
  loan_amount = loan_amount.to_f

  apr = nil
  prompt(messages('apr_entry'))
  loop do
    apr = gets.chomp
    break if number?(apr)
    prompt(messages('invalid_input2'))
  end
  apr = apr.to_f
  apr /= 100

  years = nil
  months = nil
  prompt(messages('duration_entry'))
  loop do
    years = gets.chomp
    months = gets.chomp
    break if integer?(years) && integer?(months)
    prompt(messages('invalid_input3'))
  end
  years = years.to_i
  months = months.to_i
  loan_duration = years + (months/12)

  mpr = apr / 12
  loan_duration_in_months = loan_duration * 12
  monthly_payment = (loan_amount * (mpr/(1-(1+mpr)**(-loan_duration_in_months)))).round(2)
  prompt(messages('result'))
  puts "#{monthly_payment} USD"
  # another solution to format the result with 2 decimals would be
  # puts "#{format('%.2f', monthly_payment)} USD"

prompt("Do you want to do another computation? Yes / No")
answer = gets.chomp.downcase
break unless answer.start_with?('y')
}
