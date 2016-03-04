# lizard_spock.rb

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

def display_results(player, computer)
  prompt("You chose: #{player.capitalize}; Computer chose: #{computer.capitalize}.")

  if win?(player, computer)
    prompt('You win!')
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt('Computer wins!')
  end
end

# Main Loop starts here:
loop do
  player_choice = ''
  loop do
    display_valid_choices()
    player_choice = Kernel.gets().chomp().downcase().chr
    break if valid?(player_choice)
    prompt("That's not a valid choice. Try again.")
  end

  computer_choice = VALID_CHOICES.sample
  display_results(VALID_CHOICES_HASH[player_choice], computer_choice)

  prompt("'Enter' to play again, 's' to stop.")
  play_again = Kernel.gets().chomp().downcase()
  break if play_again.start_with?('s')
end

prompt('Thanks for playing. Goodbye!')
