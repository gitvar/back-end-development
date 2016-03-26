# twentyone.rb

# Rules of Twenty-One
#
# You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).
#
# The goal of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.
#
# Setup: The game consists of a "dealer" and a "player". Both participants are initially dealt 2 cards. The player can see their 2 cards, but can only see one of the dealer's cards.
#
# Card values: card values are pretty straight forward, except for the ace. All numbers 2 through 10 are worth their face value. Jack, queen and king are worth 10. An ace, however, can be worth either 1 or 11. For example, if you have a hand of: 4, ace, jack, then the total value of your hand is 15. The ace in this case is worth 1, because if it were worth 11, the hand would be worth 25, which is a bust. It can get tricky if there are multiple aces in a hand, so your program must account for that.

# Player turn: the player goes first, and can decide to either "hit" or "stay". A hit means the player will ask for another card. Remember that if the total exceeds 21, then the player "busts" and loses. The decision to hit or stay will depend on what the player's cards are and what the player thinks the dealer has. For example, if the dealer is showing a "10" (the other card is hidden), and the player has a "2" and a "4", then the obvious choice is for the player to "hit". The player can continue to hit as many times as they want. The turn is over when the player either busts or stays. If the player busts, the game is over and the dealer won.
#
# Dealer turn: when the player stays, it's the dealer's turn. The dealer must follow a strict rule for determining whether to hit or stay: hit until the total is at least 17. If the dealer busts, then the player wins.
#
# Comparing cards: when both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.

# High level pseudo-code:
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

NEW_DECK = [{ "Ace of Hearts" => 11 },
            { "2 of Hearts" => 2 },
            { "3 of Hearts" => 3 },
            { "4 of Hearts" => 4 },
            { "5 of Hearts" => 5 },
            { "6 of Hearts" => 6 },
            { "7 of Hearts" => 7 },
            { "8 of Hearts" => 8 },
            { "9 of Hearts" => 9 },
            { "10 of Hearts" => 10 },
            { "Jack of Hearts" => 10 },
            { "Queen of Hearts" => 10 },
            { "King of Hearts" => 10 },
            { "Ace of Spades" => 11 },
            { "2 of Spades" => 2 },
            { "3 of Spades" => 3 },
            { "4 of Spades" => 4 },
            { "5 of Spades" => 5 },
            { "6 of Spades" => 6 },
            { "7 of Spades" => 7 },
            { "8 of Spades" => 8 },
            { "9 of Spades" => 9 },
            { "10 of Spades" => 10 },
            { "Jack of Spades" => 10 },
            { "Queen of Spades" => 10 },
            { "King of Spades" => 10 },
            { "Ace of Clubs" => 11 },
            { "2 of Clubs" => 2 },
            { "3 of Clubs" => 3 },
            { "4 of Clubs" => 4 },
            { "5 of Clubs" => 5 },
            { "6 of Clubs" => 6 },
            { "7 of Clubs" => 7 },
            { "8 of Clubs" => 8 },
            { "9 of Clubs" => 9 },
            { "10 of Clubs" => 10 },
            { "Jack of Clubs" => 10 },
            { "Queen of Clubs" => 10 },
            { "King of Clubs" => 10 },
            { "Ace of Diamonds" => 11 },
            { "2 of Diamonds" => 2 },
            { "3 of Diamonds" => 3 },
            { "4 of Diamonds" => 4 },
            { "5 of Diamonds" => 5 },
            { "6 of Diamonds" => 6 },
            { "7 of Diamonds" => 7 },
            { "8 of Diamonds" => 8 },
            { "9 of Diamonds" => 9 },
            { "10 of Diamonds" => 10 },
            { "Jack of Diamonds" => 10 },
            { "Queen of Diamonds" => 10 },
            { "King of Diamonds" => 10 }].freeze

DISPLAY_OFFSET = "            ".freeze
TEST = false

player_hand = []
dealer_hand = []

def prompt(message = '')
  print DISPLAY_OFFSET
  puts "=> #{message}"
end

def print_line(message = '')
  print DISPLAY_OFFSET
  puts message.to_s
end

def print_spaces
  print DISPLAY_OFFSET
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_table(dealer_hand, player_hand, player_done)
  system 'clear'
  print_line
  print_line
  print_line
  print_line "Twenty-One"
  print_line "=========="
  print_line
  print_line "Dealer Hand:"
  print_line "------------"
  dealer_total = calculate_dealer_total(dealer_hand, player_done)
  display_dealer_hand(dealer_hand, dealer_total, player_done)
  print_line
  print_line
  print_line "Player Hand:"
  print_line "------------"
  player_total = calculate_total(player_hand)
  display_hand(player_hand, "Player", player_total)
  print_line
  print_line
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def display_hand(hand, name, total)
  hand.each { |card| print_line card.keys.first.to_s }
  print_line "-----------------"
  print_line "#{name} total = #{total}"
end

def display_dealer_hand(dealer_hand, dealer_total, player_done)
  hand = []
  !player_done ? hand << dealer_hand[0] : hand = dealer_hand
  display_hand(hand, "Dealer", dealer_total)
end

def display_winner(player_hand, dealer_hand)
  if calculate_total(player_hand) > calculate_total(dealer_hand)
    print_line "Player wins!"
  elsif calculate_total(player_hand) == calculate_total(dealer_hand)
    print_line "It's a tie!"
  else
    print_line "Dealer wins!"
  end
end

def count_aces(hand)
  hand.count { |card| card.keys.first.include?("Ace") }
  # aces = 0
  # hand.each do |card|
  #   card_type = card.keys.first
  #   aces += 1 if card_type.include?("Ace")
  # end
  # aces
end

def calculate_ace_values(hand)
  bust = true
  return bust if count_aces(hand) == 0
  hand.each do |card|
    card_type = card.keys.first
    card[card_type] = 1 if card_type.include?("Ace") && card[card_type] == 11
    if calculate_total(hand) <= 21
      bust = false
      break
    end
  end
  bust
end

def calculate_total(hand)
  total = 0
  hand.each do |card|
    card_type = card.keys.first
    total += card[card_type]
  end
  total
end

def calculate_dealer_total(dealer_hand, player_done)
  if player_done
    calculate_total(dealer_hand)
  else
    card_type = dealer_hand[0].keys.first
    dealer_hand[0][card_type]
  end
end

def dealer_loop(player_hand, dealer_hand, game_deck)
  loop do
    if calculate_total(dealer_hand) > 21
      bust = calculate_ace_values(dealer_hand)
      break if bust
    elsif calculate_total(dealer_hand) >= 17 && calculate_total(dealer_hand) <= 21
      break
    else
      dealer_hand << game_deck.pop
    end
    display_table(dealer_hand, player_hand, true)
  end
  true
end

def player_stays?
  prompt "Enter to hit, 's' to stay."
  print_spaces
  continue = gets.chomp.downcase
  return true if continue.start_with?('s')
  false
end

def player_loop(player_hand, dealer_hand, game_deck, player_done)
  loop do
    if calculate_total(player_hand) > 21
      bust = calculate_ace_values(player_hand)
      break if bust
      display_table(dealer_hand, player_hand, player_done)
      break if player_stays?
    elsif player_stays?
      break
    end
    player_hand << game_deck.pop
    display_table(dealer_hand, player_hand, player_done)
  end
  true
end

def deal_first_cards(game_deck, player_hand, dealer_hand)
  if TEST
    player_hand << { "Ace of Hearts" => 11 }
    player_hand << { "Two of Clubs" => 2 }
    dealer_hand << { "Ace of Clubs" => 11 }
    dealer_hand << { "Ace of Diamonds" => 11 }
    dealer_hand << { "Ace of Spades" => 11 }
  else
    2.times do
      player_hand << game_deck.pop
      dealer_hand << game_deck.pop
    end
  end
end

def shuffle_new_deck
  NEW_DECK.shuffle
end

loop do
  player_done = false
  player_hand = []
  dealer_hand = []

  game_deck = shuffle_new_deck.shuffle
  deal_first_cards(game_deck, player_hand, dealer_hand)
  display_table(dealer_hand, player_hand, player_done)

  player_done = player_loop(player_hand, dealer_hand, game_deck, player_done)
  if player_done && calculate_total(player_hand) <= 21
    display_table(dealer_hand, player_hand, player_done)
    dealer_done = dealer_loop(player_hand, dealer_hand, game_deck)
    if dealer_done && calculate_total(dealer_hand) <= 21
      display_winner(player_hand, dealer_hand)
    else
      print_line "Dealer bust. Player wins!"
    end
  else
    print_line "Player bust. Dealer wins!"
  end
  print_line
  prompt "Enter to play again, 's' to stop."
  print_spaces
  continue = gets.chomp.downcase
  break if continue.start_with?("s")
end
