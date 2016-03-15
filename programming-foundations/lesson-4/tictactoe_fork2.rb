# tictactoe.rb

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# Step 1: Display the empty board.
def display_board(brd)
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  # returns an array of keys pointing to INITIAL_MARKER values (empty spaces).
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square [#{empty_squares(brd).join(', ')}]")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "That is not a valid entry. Try again."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  winning_patterns = { 1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9], 4=> [1, 5, 9],
                        5 => [3, 5, 7], 6 => [1, 4, 7], 7 => [3, 6, 9] }

  # loop each pattern (if brd[winning_patterns[n]] == PLAYER_MARKER -> inc cntr)
  # if cntr == 3 winner is player.
  
  winning_patterns.each_value do |pattern|
    cntr1 = 0
    cntr2 = 0
    pattern.each do |position|
      cntr1 += 1 if brd[position] == PLAYER_MARKER
      return "Player wins!" if cntr1 == 3
      cntr2 += 1 if brd[position] == COMPUTER_MARKER
      return "Computer wins!" if cntr2 == 3
    end
  end
  return nil
end

def board_full?(brd)
    empty_squares(brd).empty? # same as empty_squares(brd) == []
end

board = initialize_board
display_board(board)
loop do
  player_places_piece!(board)
  computer_places_piece!(board)
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

puts "#{someone_won?(board)}"
