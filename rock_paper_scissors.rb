VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTCUTS = %w(r p s l sp)
WINNING_POINTS = 5

def prompt(message)
  puts "=> #{message}"
end

def wins?(player, computer)
  player == 'rock' && (computer == 'scissors' || computer == 'lizard') ||
    player == 'scissors' && (computer == 'paper' || computer == 'lizard') ||
    player == 'paper' && (computer == 'rock' || computer == 'spock') ||
    player == 'lizard' && (computer == 'spock' || computer == 'paper') ||
    player == 'spock' && (computer == 'rock' || computer == 'scissors')
end

def shortcut_to_choice(shortcut)
  case shortcut
  when "r"
    "rock"
  when "p"
    "paper"
  when "s"
    "scissors"
  when "l"
    "lizard"
  when "sp"
    "spock"
  end
end

def results(player, computer)
  if wins?(player, computer)
    "You won!"
  elsif wins?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

welcome_message = <<-TXT
Welcome to rock, paper, scissors, lizard, spock!
The rules are simple: You play against the computer,
the first one who reaches #{WINNING_POINTS} points wins!
Good luck!
TXT

selection_message = <<-TXT
Pick a shortcut: #{SHORTCUTS.join(', ')}
or #{VALID_CHOICES.join(', ')}:
TXT

prompt(welcome_message)
puts()
prompt("Please enter your name:")
name = gets.chomp.upcase!

loop do
  player_score = 0
  computer_score = 0

  loop do
    choice = ''

    loop do
      prompt(selection_message)
      choice = gets.chomp
      puts()
      break if VALID_CHOICES.include?(choice)
      SHORTCUTS.include?(choice) ? break : (puts "That's not a valid choice.")
    end

    choice = shortcut_to_choice(choice) if SHORTCUTS.include?(choice)

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice} ------ Computer chose: #{computer_choice}")

    prompt(results(choice, computer_choice))

    if results(choice, computer_choice) == "You won!"
      player_score += 1
      prompt("#{name}: #{player_score} ------ COMPUTER: #{computer_score}")
    elsif results(choice, computer_choice) == "Computer won!"
      computer_score += 1
      prompt("#{name}: #{player_score} ------ COMPUTER: #{computer_score}")
    else
      prompt("#{name}: #{player_score} ------ COMPUTER: #{computer_score}")
    end
    puts()

    break if player_score == WINNING_POINTS || computer_score == WINNING_POINTS
  end

  if player_score == WINNING_POINTS
    prompt("Congratulations #{name.capitalize}, you won that game!")
  else
    prompt("Don't worry #{name.capitalize}, you will be better next time! ;)")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end
