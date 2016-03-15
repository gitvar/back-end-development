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

def prompt(msg)
  puts "=> #{msg}"
end

def is_num?(number)
  number.to_s.to_i == number.to_i
end

# Setp 1: Display the empty board.
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

def is_valid_entry?(number, brd)
  if !is_num?(number) || !(1..9).include?(number) || brd[number] != ' '
    false
  else
    true
  end
end

def initialize_board
  new_board = {}
  (0..9).each { |num| new_board[num] = ' '}
  new_board[5] = 'O'
  new_board
end

def player_places_piece(brd)
  loop do
    prompt("Choose a square (1 - 9):")
    square = gets.chomp.to_i
    if is_valid_entry?(square, brd)
      brd[square] = 'X'
      return
    end
    puts "That is not a valid entry. Try again."
  end
end

board = initialize_board
display_board(board)
player_places_piece(board)
display_board(board)
