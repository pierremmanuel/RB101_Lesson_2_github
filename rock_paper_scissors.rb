VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}
  "
end

def wins?(first, second)
  first == 'rock' && (second == 'scissors' || second == 'lizard') ||
  first == 'scissors' && (second == 'paper' || second == 'lizard') ||
  first == 'paper' && (second == 'rock' || second == 'spock') ||
  first == 'lizard' && (second == 'spock' || second == 'paper') ||
  first == 'spock' && (second == 'rock' || second == 'scissors')
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

def display_results(player, computer)
  if wins?(player, computer)
    puts 'You won!'
  elsif wins?(computer, player)
    puts "Computer won"
  else
    puts "It's a tie!"
  end
end

puts <<-MSG

Welcome to rock, paper, scissors, lizard, spock!
The rules are simple:
You play against the computer, first one who reaches 5 points wins!
Good luck!

MSG

loop do

  player_score = 0
  computer_score = 0
  
  loop do
    choice = nil
      loop do
        prompt("Choose one: #{VALID_CHOICES.join(', ')}, pick a shortcut: 'r', 'p', 's', 'l' or 'sp':")
        choice = Kernel.gets().chomp()

        if VALID_CHOICES.include?(shortcut_to_choice(choice))
          break
        else
          puts "That's not a valid choice."
        end
      end

    computer_choice = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample

    puts "You chose: #{shortcut_to_choice(choice)}; Computer chose: #{computer_choice}"

    display_results(shortcut_to_choice(choice), computer_choice)

    if wins?(shortcut_to_choice(choice), computer_choice)
      player_score += 1
      prompt("Your score is #{player_score}; Computer's score is #{computer_score}!")
      if player_score == 5
        puts "You won the game, congratulatons!"
        break
      end
    elsif wins?(computer_choice, shortcut_to_choice(choice))
      computer_score += 1
      puts "Your score is #{player_score}; Computer's score is #{computer_score}!"
      if computer_score == 5
        puts "You lost the game, too bad!"
        break
      end
    else
      puts "Your score is #{player_score}; Computer's score is #{computer_score}!"
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end
