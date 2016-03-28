# twentyone.rb

VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
SUITS = %w(Hearts Spades Clubs Diamonds).freeze
DEALER_MAX = 17
DISPLAY_OFFSET = "            ".freeze

def create_deck
  card_parts = VALUES.product(SUITS)
  new_deck = []
  card_parts.each do |card_part|
    key = "#{card_part[0]} of #{card_part[1]}"
    value = card_part[0].to_i
    value = 10 if %w(Jack Queen King).include?(key.split[0])
    value = 11 if key.include?("Ace")
    new_deck << { key => value.to_i }
  end
  new_deck.shuffle
end

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
def display_table(dealer_hand, player_hand, player_done = true)
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
  label = busted?(hand) ? ": Bust!" : ''
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
  total(hand) > 21
end

def ace_count(hand)
  hand.count { |card| card.keys.first.include?("Ace") }
end

def bust_after_aces_recalc(hand)
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
  total(hand) >= DEALER_MAX
end

def dealer_turn(player_hand, dealer_hand, game_deck)
  loop do
    if busted?(dealer_hand)
      break if bust_after_aces_recalc(dealer_hand)
    elsif dealer_max_reached?(dealer_hand) || total(dealer_hand) > total(player_hand)
      break
    else
      dealer_hand << game_deck.pop
    end
    display_table(dealer_hand, player_hand)
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

def player_turn(player_hand, dealer_hand, game_deck, player_done)
  loop do
    if busted?(player_hand)
      break if bust_after_aces_recalc(player_hand)
      display_table(dealer_hand, player_hand, player_done)
    end
    break if player_stays?
    player_hand << game_deck.pop
    display_table(dealer_hand, player_hand, player_done)
  end
end

def deal_first_cards(game_deck, player_hand, dealer_hand)
  2.times do
    player_hand << game_deck.pop
    dealer_hand << game_deck.pop
  end
end

loop do
  player_done = false
  player_hand = []
  dealer_hand = []

  game_deck = create_deck.shuffle
  deal_first_cards(game_deck, player_hand, dealer_hand)
  display_table(dealer_hand, player_hand, player_done)

  player_turn(player_hand, dealer_hand, game_deck, player_done)
  if !busted?(player_hand)
    display_table(dealer_hand, player_hand)
    dealer_turn(player_hand, dealer_hand, game_deck)
  end
  display_winner(player_hand, dealer_hand)

  prompt "Enter to play again, 's' to stop."
  print_spaces("=>")
  continue = gets.chomp.downcase
  break if continue.start_with?("s")
end

print_line
prompt "Thanks for playing Twenty-One! Until next time ..."
