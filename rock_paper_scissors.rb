VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTCUTS = %w(r p sc l sp)
WINNING_POINTS = 5

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear')
end

def wins?(player, computer)
  winning_moves = { scissors: %w(paper lizard),
                    rock: %w(lizard scissors),
                    paper: %w(rock spock),
                    lizard: %w(paper spock),
                    spock: %w(rock scissors) }
  winning_moves[player.to_sym].include?(computer)
end

def shortcut_to_choice(shortcut)
  case shortcut
  when "r"
    "rock"
  when "p"
    "paper"
  when "sc"
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


rules_message = <<-TXT
RULES
>> The game is very simple: you play against the computer and you must pick one
>> amongst rock, paper, scissors, lizard, spock.
>> The first one who reaches #{WINNING_POINTS} points is the champion!
>> Good luck!
TXT

selection_message = <<-TXT
Pick a shortcut: #{SHORTCUTS.join(', ')}
>> (or #{VALID_CHOICES.join(', ')}):
TXT

clear_screen()
prompt("Welcome to ROCK, PAPER, SCISSORS, LIZARD, SPOCK!")
name = ''
loop do
  prompt("What's your name?")
  name = gets.chomp.upcase
  break unless name.empty?
  puts(">> You have to pick something!")
end
puts()
prompt(rules_message)
puts()

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

  clear_screen()

  if player_score == WINNING_POINTS
    prompt("Congratulations #{name.capitalize}, you won that game!")
    prompt("Your final score is #{player_score}, \
    computer final score is #{computer_score}")
  else
    prompt("Don't worry #{name.capitalize}, you will be better next time! ;)")
    prompt("Your final score is #{player_score}, \
computer final score is #{computer_score}")
  end

  prompt("Do you want to play again? 'yes' / 'no'")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

clear_screen()

prompt("Thanks for playing! Come back soon!")
