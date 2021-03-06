# twenty_one_bonus.rb
# Launch School's twentyone.rb used for the bonus assignments.

require 'pry'

# Question 5: Constants added,
WINNING_TOTAL = 21 # Name of the game!
DEALER_MAX = 17 # Dealer stays when total >= 17
MAX_POINTS = 5 # First to 5 points win the match.

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  msg == "blank" ? (puts " ") :(puts "=> #{msg}")
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > WINNING_TOTAL
  end

  sum
end

def busted?(cards)
  total(cards) > WINNING_TOTAL
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WINNING_TOTAL
    :player_busted
  elsif dealer_total > WINNING_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_points(points = [0,0], no_of_games = 0)
  player = 0
  dealer = 1
  if points.include?(MAX_POINTS)
    points[player] == MAX_POINTS ? winner = "You" : winner = "the Dealer"
    prompt "The winner, with a total of #{MAX_POINTS} points, is: #{winner}!"
  else
    prompt "Your score after #{no_of_games} games is #{points[player]}."
    prompt "Dealer score after #{no_of_games} games is #{points[dealer]}."
  end
end

def display_result(dealer_cards, player_cards, no_of_games = 0, points = [0, 0])
  display_compare_cards(player_cards, dealer_cards)
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end

  points = update_points(dealer_cards, player_cards, no_of_games, points)
  display_points(points, no_of_games)
end

# Question 4: Add score (best of 5 games)
def update_points(dealer_cards, player_cards, no_of_games = 0, points = [0, 0])
  player = 0
  dealer = 1
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted
    points[dealer] += 1
  when :dealer_busted
    points[player] += 1
  when :player
    points[player] += 1
  when :dealer
    points[dealer] += 1
  end

  points
end

def play_again?
  puts "-------------"
  prompt("blank")
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# Question 3: Extract "compare_cards" code to method.
def display_compare_cards(player_cards, dealer_cards)
  # compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end


# initialze vars:
number_of_games = 0
points = [0, 0]

loop do
  system 'clear'
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initialize score and game count
  if points.include?(MAX_POINTS)
    number_of_games = 0
    points = [0, 0]
  end

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  number_of_games += 1

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."
  prompt "blank"

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards, number_of_games, points)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_MAX

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  # Question 1: Watch out for code which will change the value cached in the local variable. Make sure to update the local variable when required.
  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_cards, player_cards, number_of_games, points)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  display_result(dealer_cards, player_cards, number_of_games, points)
  break unless play_again?
  # This call to play_again? is different because the result has only one effect (if false, then break out of the main loop). Otherwise nothing. The program is already at the end of the loop and a new iteration through the main loop will start automatically if play_again? returns true. Thus no need for a ternary operation and the "next" command.
end

prompt "Thank you for playing Twent-One! Good bye!"
