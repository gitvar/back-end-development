# ttt_bonus_1.rb

# Improved "join"

require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
SEPARATOR = ', '.freeze
END_WORD = 'or'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear' # For Mac Terminal
  puts
  puts
  puts 'Tic Tac Toe!'.center(27)
  print '    '
  17.times { print '=' }
  puts
  puts "       Player: #{PLAYER_MARKER}"
  puts "       Computer: #{COMPUTER_MARKER}"
  print '    '
  17.times { print '-' }
  puts '    '
  puts '    '
  puts '         |     |'
  puts "      #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '         |     |'
  puts '    -----+-----+-----'
  puts '         |     |'
  puts "      #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '         |     |'
  puts '    -----+-----+-----'
  puts '         |     |'
  puts "      #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '         |     |'
  puts '    '
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  # returns an array of keys pointing to INITIAL_MARKER values (empty spaces).
end

def joiner(empty_squares_array, separator = ', ', end_word = 'or')
  if empty_squares_array.count > 1
    str = empty_squares_array.join("#{separator}")
    str[str.length-3] = " #{end_word}"
    str
  else
    str = empty_squares_array[0]
  end
end
# Bonus Feature 1:
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt("Choose a square: #{joiner(empty_squares(brd))}")
    # prompt("Choose a square: #{joiner(empty_squares(brd), SEPARATOR)}")
    prompt("Choose a square: #{joiner(empty_squares(brd), SEPARATOR, END_WORD)}")
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

def board_full?(brd)
  empty_squares(brd).empty? # same as empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd) # !! (bang bang) forces return value (string) to boolean,,,,,
end

def check_winner(brd, line, marker)
  # brd.values_at(line[0], line[1], line[2]).count(marker) == 3
  brd.values_at(*line).count(marker) == 3
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if check_winner(brd, line, PLAYER_MARKER)
      return "Player"
    elsif check_winner(brd, line, COMPUTER_MARKER)
      return "Computer"
    end
  end
  nil # return nil to force someone_won? to return false. "nil = false"
end

loop do
  board = initialize_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  puts ""
  prompt "Play again? (y or n)."
  continue = gets.chomp.downcase
  break if !continue.start_with?("y")
end

prompt "Goodbye, thanks for playing!"
