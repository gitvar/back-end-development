# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'paper') ||
    (player == 'paper' && computer == 'rock')
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
    prompt("Please choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()
    break if VALID_CHOICES.include?(choice)
    prompt('That\'s not a valid choice. Try again.')
  end

  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice)

  prompt('Play again? (Y) to continue ...')
  play_again = Kernel.gets().chomp().downcase()
  break unless play_again.start_with?('y')
end

prompt('Thanks for playing. Goodbye!')
