# twentyone.rb

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

DEALER_MAX = 17
DISPLAY_OFFSET = "            ".freeze
TEST_ACE_CALCS = false

player_hand = []
dealer_hand = []

def prompt(message = '')
  print DISPLAY_OFFSET
  puts "=> #{message}"
end

def print_line(message = '', n = 1)
  n.times do
    print DISPLAY_OFFSET
    puts message.to_s
  end
end

def print_spaces(symbol = '')
  print DISPLAY_OFFSET
  print symbol + " "
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
  dealer_total = initial_dealer_total(dealer_hand, player_done)
  display_dealer_hand(dealer_hand, dealer_total, player_done)
  print_line
  print_line
  print_line "Player Hand:"
  print_line "------------"
  player_total = total(player_hand)
  display_hand(player_hand, "Player", player_total)
  print_line
  print_line
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def display_hand(hand, name, total)
  hand.each { |card| print_line card.keys.first.to_s }
  print_line "-----------------"
  busted?(hand) ? label = ": Bust!" : label = ''
  print_line "#{name} total = #{total} #{label}"
end

def display_dealer_hand(dealer_hand, dealer_total, player_done)
  hand = []
  !player_done ? hand << dealer_hand[0] : hand = dealer_hand
  display_hand(hand, "Dealer", dealer_total)
end

def display_winner(player_hand, dealer_hand)
  case
  when busted?(player_hand)
    print_line "****** DEALER WINS! ******"
  when busted?(dealer_hand)
    print_line "****** PLAYER WINS! ******"
  when total(player_hand) < total(dealer_hand)
    print_line "****** DEALER WINS! ******"
  when total(player_hand) > total(dealer_hand)
    print_line "****** PLAYER WINS! ******"
  else
    print_line "It's a PUSH! Nobody wins."
  end
  print_line(" ", 2)
end

def busted?(hand)
  total(hand) > 21 ? true : false
end

def ace_count(hand)
  hand.count { |card| card.keys.first.include?("Ace") }
end

def bust_after_aces_recalc?(hand)
  return true if ace_count(hand) == 0
  hand.each do |card|
    card_type = card.keys.first
    card[card_type] = 1 if card_type.include?("Ace") && card[card_type] == 11
    return false if !busted?(hand)
  end
  true
end

def total(hand)
  hand_total = 0
  hand.each do |card|
    card_type = card.keys.first
    hand_total += card[card_type]
  end
  hand_total
end

def initial_dealer_total(dealer_hand, player_done)
  if player_done
    total(dealer_hand)
  else
    card_type = dealer_hand[0].keys.first
    dealer_hand[0][card_type]
  end
end

def dealer_max_reached?(hand)
  total(hand) >= DEALER_MAX ? true : false
end

def dealer_loop(player_hand, dealer_hand, game_deck)
  loop do
    if busted?(dealer_hand)
      break if bust_after_aces_recalc?(dealer_hand)
    elsif dealer_max_reached?(dealer_hand)
      break
    elsif total(dealer_hand) > total(player_hand)
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
  print_spaces("=>")
  continue = gets.chomp.downcase
  return true if continue.start_with?('s')
  false
end

def player_loop(player_hand, dealer_hand, game_deck, player_done)
  loop do
    if busted?(player_hand)
      break if bust_after_aces_recalc?(player_hand)
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
  if TEST_ACE_CALCS
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
  if player_done && !busted?(player_hand)
    display_table(dealer_hand, player_hand, player_done)
    dealer_loop(player_hand, dealer_hand, game_deck)
  end
  display_winner(player_hand, dealer_hand)

  prompt "Enter to play again, 's' to stop."
  print_spaces("=>")
  continue = gets.chomp.downcase
  break if continue.start_with?("s")
end
