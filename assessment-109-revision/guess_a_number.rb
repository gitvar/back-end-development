# The program will first randomly pick a number between 1 and 100. The program will then ask the user to guess the number. If the user guesses correctly, the program will end. If the user guessed too high or low, the program will respond with "Your number is to high" or "Your number is to low" respectively, and allow the user to guess again. After finally guessing the number, the program will display how many guesses the user took to guess the number.

def pick_num
  arr = (1..100).to_a
  num = arr.sample
  num
end

def prompt(str)
  puts "=> " + str
end

rand_num = pick_num
prompt("The Random Number is: #{rand_num}")

guess_counter = 1

prompt("Please guess a number between 1 and 100")
user_num = gets.chomp.to_i

while guess_counter > 0

  if user_num == rand_num
    prompt("Wow, you guessed the number correctly!")
    prompt("You took exactly #{guess_counter} guesses to get the number!")
    guess_counter = 0
    break
  elsif user_num > rand_num
    prompt("Your number is too high!")
  else
    prompt("Your number is too low!")
  end

prompt("Please guess again:")
user_num = gets.chomp.to_i
guess_counter += 1
end
