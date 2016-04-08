# Build deck of cards

suits = %w(Hearts Clubs Diamonds Spades)
values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

built_pack = suits.product(values)
p built_pack

new_deck = {}  

built_pack.each do |partial_card|
    key = partial_card[1] + " of " + partial_card[0]
    new_deck[key] = partial_card[1].to_i
    new_deck[key] = 10 if new_deck[key] == 0
    new_deck[key] = 11 if key.include?("Ace")
    p "new_deck[#{key}] = #{new_deck[key]}"
    p new_deck
end