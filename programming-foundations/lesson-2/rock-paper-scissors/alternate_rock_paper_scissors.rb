# alternate_rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors).freeze

def test_method
  prompt("test_method")
end

#test_method() # Causes error -> 'test_method': undefined method 'prompt'

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method()

def calculate_result(player, computer)
  if (player == "rock" && computer == "scissors") ||
      (player == "scissors" && computer == "paper") ||
      (player == "paper" && computer == "rock")
    result = "You win!"
  elsif player == computer
    result = "It's a tie!"
  else
    result = "Computer wins!"
  end
end

loop do

  choice = ''

  loop do
    prompt("Please choose one: #{VALID_CHOICES.join(", ")}")
    choice = Kernel.gets().chomp().downcase()
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice. Try again.")
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  puts calculate_result(choice, computer_choice)

  prompt("Play again? (Y) to continue ...")
  play_again = Kernel.gets().chomp().downcase()
  break unless play_again.start_with?('y')
end

prompt("Thanks for playing. Goodbye!")
