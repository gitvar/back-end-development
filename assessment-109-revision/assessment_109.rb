# The program will first randomly pick a number between 1 and 100. The program will then ask the user 
# to guess the number. If the user guesses correctly, the program will end. If the user guessed too high 
# or low, the program will respond with "Your number is to high" or "Your number is to low" respectively, 
# and allow the user to guess again. After finally guessing the number, the program will display how many 
# guesses the user took to guess the number.

# Pseudo Code:
# 1. Pick a random number between 1 and 100
# 2. Ask user to choose a number.
# 3. If user's and random numbers are the same, tell the user how many guesses it took, and end the program.
# 4. If the number is too high, the user must be shown the message: "Your number is to high"
# 5. If the number is too low, the user must be shown this message: "Your number is to low"
# 6. The user will be given another chance to guess the number: back to 2.

loop do
  system "clear"
  guess_counter = 1
  
  random_number = (1..100).to_a.sample
  puts "Please choose a number between 1 and 100."
  
  begin
    user_guess = gets.chomp.to_i
    if random_number == user_guess
      puts "You guessed it correctly! You took #{guess_counter} guesses to get the right number."
      guess_counter = -1
    elsif user_guess > random_number
      puts "Your number is to high."
    else
      puts "Your number is to low."
    end
    puts "Please guess again." if guess_counter != -1
    guess_counter += 1
  end until guess_counter == 0
  
  puts "Play again? (Yes or No)"
  continue = gets.chomp.downcase
  break if continue.start_with?("n")
end