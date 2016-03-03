# lizard_spock.rb

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze
VALID_CHOICES_DISPLAY = %w((r)ock (p)aper s(c)issors (l)izard (s)pock).freeze
VALID_ABBREVIATED_CHOICES = %w(r p c l s).freeze
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
  prompt("You chose: #{player}; Computer chose: #{computer}.")

  if win?(player, computer)
    prompt('You win!')
  elsif player == computer
    prompt('It\'s a tie!')
  else
    prompt('Computer wins!')
  end
end

loop do
  choice = ''
  loop do
    prompt("Please choose one: #{VALID_CHOICES_DISPLAY.join(', ')}")
    choice = Kernel.gets().chomp().downcase()
    choice = choice[0]
    break if VALID_ABBREVIATED_CHOICES.include?(choice)
    prompt('That\'s not a valid choice. Try again.')
  end

  computer_choice = VALID_CHOICES.sample
  display_results(VALID_CHOICES_HASH[choice], computer_choice)

  prompt('Play again? (Y) to continue ...')
  play_again = Kernel.gets().chomp().downcase()
  break unless play_again.start_with?('y')
end

prompt('Thanks for playing. Goodbye!')
