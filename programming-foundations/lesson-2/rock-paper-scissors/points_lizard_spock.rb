# points_lizard_spock.rb

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze
VALID_CHOICES_FOR_DISPLAY = %w((r)ock (p)aper s(c)issors (l)izard (s)pock).freeze
VALID_CHOICES_HASH = { 'r' => 'rock', 'p' => 'paper', 'c' => 'scissors',
                       'l' => 'lizard', 's' => 'spock' }.freeze
WINNING_COMBINATIONS = [%w(rock scissors),
                        %w(scissors paper),
                        %w(paper rock),
                        %w(rock lizard),
                        %w(lizard spock),
                        %w(spock scissors),
                        %w(scissors lizard),
                        %w(lizard paper),
                        %w(paper spock),
                        %w(spock rock)].freeze

def display_valid_choices
  prompt("Choose one by typing the letter in brackets: #{VALID_CHOICES_FOR_DISPLAY.join(', ')}:")
end

def valid?(choice)
  VALID_CHOICES_HASH.key?(choice)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  WINNING_COMBINATIONS.each do |element_1, element_2|
    return true if player == element_1 && computer == element_2
  end
  false
end

def we_have_a_winner?(player_points, computer_points)
  if player_points >= 5
    prompt("You win the game #{player_points} to #{computer_points}!")
  elsif computer_points >= 5
    prompt("Computer wins the game #{computer_points} to #{player_points}!")
  else
    return false
  end
  true
end

def display_round_result(winner, player_choice, computer_choice)
  prompt("You chose: #{VALID_CHOICES_HASH[player_choice.chr].capitalize}, Computer chose: #{computer_choice.capitalize}.")
  if winner == 'player'
    prompt('You win the round!')
  elsif winner == 'computer'
    prompt('Computer wins the round!')
  else
    prompt('The round is a tie!')
  end
end

def calculate_round_result(player, computer)
  if win?(player, computer)
    'player'
  elsif player == computer
    'tie'
  else
    'computer'
  end
end

loop do # main loop
  player_choice = ''
  player_score = 0
  computer_score = 0

  prompt('First one to 5 points wins!')

  loop do # round loop
    prompt("Player score = #{player_score} : Computer score = #{computer_score}")
    loop do # valid entry loop
      display_valid_choices()
      player_choice = Kernel.gets().chomp().downcase()
      break if valid?(player_choice.chr)
      prompt("That's not a valid choice. Try again.")
    end

    computer_choice = VALID_CHOICES.sample

    round_winner = calculate_round_result(VALID_CHOICES_HASH[player_choice.chr], computer_choice)
    display_round_result(round_winner, player_choice, computer_choice)

    if round_winner == 'player'
      player_score += 1
    elsif round_winner == 'computer'
      computer_score += 1
    end # if round_result == 'tie' do nothing ...

    break if we_have_a_winner?(player_score, computer_score)
  end

  prompt("'Enter' to play again, 's' to stop.")
  play_again = Kernel.gets().chomp().downcase()
  break if play_again.start_with?('s')
end

prompt('Thanks for playing. Goodbye!')
