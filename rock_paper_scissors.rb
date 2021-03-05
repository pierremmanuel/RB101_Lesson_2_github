VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_SHORTCUTS = %w(r p s l sp)
WINNING_POINTS = 5

def prompt(message)
  puts "=> #{message}"
end

def wins?(player, computer)
  player == 'r' && (computer == 's' || computer == 'l') ||
  player == 's' && (computer == 'p' || computer == 'l') ||
  player == 'p' && (computer == 'r' || computer == 'sp') ||
  player == 'l' && (computer == 'sp' || computer == 'p') ||
  player == 'sp' && (computer == 'r' || computer == 's')
end

def shortcut_to_choice(shortcut)
  case shortcut
  when "r"
    return "rock"
  when "p"
    return "paper"
  when "s"
    return "scissors"
  when "l"
    return "lizard"
  when "sp"
    return "spock"
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

prompt("Welcome to rock, paper, scissors, lizard, spock! \
The rules are simple: You play against the computer, \
the first one who reaches #{WINNING_POINTS} points wins! \
Good luck!")
puts()

loop do

  player_score = 0
  computer_score = 0

  loop do
    choice = ''

      loop do
        prompt("Pick a shortcut: #{VALID_SHORTCUTS.join(', ')} for #{VALID_CHOICES.join(', ')}:")
        choice = gets.chomp
        puts()
        VALID_SHORTCUTS.include?(choice) ? break : (puts "That's not a valid choice.")
      end

    computer_choice = VALID_SHORTCUTS.sample

    prompt("You chose: #{shortcut_to_choice(choice)} \
            Computer chose: #{shortcut_to_choice(computer_choice)}")

    prompt(results(choice, computer_choice))

    if results(choice, computer_choice) == "You won!"
      player_score += 1
      prompt("YOU: #{player_score}! \
             COMPUTER: #{computer_score}!")
      puts()
    elsif results(choice, computer_choice) == "Computer won!"
      computer_score += 1
      prompt("YOU: #{player_score}! \
             COMPUTER: #{computer_score}!")
      puts()
    else
      prompt("YOU: #{player_score}! \
            COMPUTER: #{computer_score}!")
      puts()
    end

    break if player_score == WINNING_POINTS || computer_score == WINNING_POINTS

  end

  if player_score == WINNING_POINTS
    prompt("Congratulations, you won that game! Next time it will be different!")
  else
    prompt("That's OK, you will be better next time! ;)")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')

end
