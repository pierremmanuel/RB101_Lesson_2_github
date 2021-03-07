VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTCUTS = %w(r p sc l sp)
WINNING_POINTS = 5

RULES_MESSAGE = <<-TXT
RULES
>> The game is very simple: you play against the computer and you must pick one
>> amongst rock, paper, scissors, lizard, spock.
>> The first one who reaches #{WINNING_POINTS} points is the champion!
>> Good luck!
TXT

SELECTION_MESSAGE = <<-TXT
Pick a shortcut: #{SHORTCUTS.join(', ')}
>> (or #{VALID_CHOICES.join(', ')}):
TXT

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear')
end

def get_name
  name = nil
  loop do
    prompt("What's your name?")
    name = gets.chomp.upcase
    break unless name.empty?
    puts(">> You have to pick something!")
  end
  name
end

def get_player_choice
  choice = ''
  loop do
    prompt(SELECTION_MESSAGE)
    choice = gets.chomp
    puts()
    break if VALID_CHOICES.include?(choice.downcase!)
    SHORTCUTS.include?(choice) ? break : (puts "That's not a valid choice.")
  end
  choice
end

def wins?(player1, player2)
  winning_moves = { scissors: %w(paper lizard),
                    rock: %w(lizard scissors),
                    paper: %w(rock spock),
                    lizard: %w(paper spock),
                    spock: %w(rock scissors) }
  winning_moves[player1.to_sym].include?(player2)
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

def display_choices(choices)
  prompt("You chose: #{choices[:player]} ------ " \
    "Computer chose: #{choices[:computer]}")
end

def results(choices)
  if wins?(choices[:player], choices[:computer])
    "You won!"
  elsif wins?(choices[:computer], choices[:player])
    "Computer won!"
  else
    "It's a tie!"
  end
end

def new_player_score(choices, scores)
  if wins?(choices[:player], choices[:computer])
    scores[:player] += 1
  end
  scores[:player]
end

def new_computer_score(choices, scores)
  if wins?(choices[:computer], choices[:player])
    scores[:computer] += 1
  end
  scores[:computer]
end

def game_over?(scores, player_name)
  if scores[:player] == WINNING_POINTS
    prompt("Congratulations #{player_name.capitalize}," \
            "you won that game!")
    prompt("Your final score is #{scores[:player]}, " \
           "computer final score is #{scores[:computer]}")
  else
    prompt("Don't worry #{player_name.capitalize}, " \
           "you will be better next time! ;)")
    prompt("Your final score is #{scores[:player]}," \
           "computer final score is #{scores[:computer]}")
  end
end

def play_again?
  prompt("Do you want to play again? 'yes' / 'no'")
  answer = gets.chomp
  return true if answer.downcase.start_with?('y')
end

clear_screen()
prompt("Welcome to ROCK, PAPER, SCISSORS, LIZARD, SPOCK!")

player_name = get_name
puts()
prompt(RULES_MESSAGE)
puts()

scores = { player: 0, computer: 0 }
choices = { player: '', computer: '' }

loop do
  loop do
    choices[:player] = get_player_choice()
    choices[:player] = shortcut_to_choice(choices[:player]) \
    if SHORTCUTS.include?(choices[:player])

    choices[:computer] = VALID_CHOICES.sample
    # I tried to avoid screen cleaning for the last point by lines no.141 and no. 142 don't work...
    clear_screen() unless ((scores[:player] == WINNING_POINTS || \
    scores[:computer]) == WINNING_POINTS)

    display_choices(choices)
    prompt(results(choices))

    scores[:player] = new_player_score(choices, scores)
    scores[:computer] = new_computer_score(choices, scores)

    prompt("#{player_name}: #{scores[:player]} " \
      "------ COMPUTER: #{scores[:computer]}")
    puts()

    break if (scores[:player] || scores[:computer]) == WINNING_POINTS
  end

  clear_screen()
  game_over?(scores, player_name)
  break unless play_again?()
  scores = { player: 0, computer: 0 }
  clear_screen()
end

prompt("Thanks for playing! Come back soon!")
