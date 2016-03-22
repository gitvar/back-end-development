# ttt_bonus_2_score.rb

# Keep score (no constants or globals). First one to reach 5, wins.

require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
SEPARATOR = ', '.freeze
END_WORD = 'or'.freeze
DISPLAY_OFFSET = '          '.freeze
DISPLAY_UNDERLINE =        '-----------------'.freeze
DISPLAY_DOUBLE_UNDERLINE = '================='.freeze
PLAYER = 0
COMPUTER = 1
MAX_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display(display_string = '')
  puts DISPLAY_OFFSET + display_string
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, scores, comment = '')
  system 'clear' # For Mac Terminal
  display
  display
  display 'Tic Tac Toe!'.center(18)
  display
  display(DISPLAY_DOUBLE_UNDERLINE)
  display
  display "Player: #{PLAYER_MARKER}"
  display "Computer: #{COMPUTER_MARKER}"
  display
  display(DISPLAY_UNDERLINE)
  display
  display "Player Score: #{scores[PLAYER]}"
  display "Computer Score: #{scores[COMPUTER]}"
  display
  display(DISPLAY_UNDERLINE)
  display
  display
  display '     |     |'
  display "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  display '     |     |'
  display '-----+-----+-----'
  display '     |     |'
  display "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  display '     |     |'
  display '-----+-----+-----'
  display '     |     |'
  display "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  display '     |     |'
  display
  display
  display comment
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

# Bonus 1: My Joinor Method:
def joinor(empty_squares_array, separator = ', ', end_word = 'or')
  str = empty_squares_array[0]
  if empty_squares_array.count > 1
    str = empty_squares_array.join(separator.to_s)
    str[str.length - 3] = " #{end_word}"
  end
  str
end
# Launch Schoo; Solution: So much more logical and elegant!!!
# def joinor(arr, delimiter=', ', word='or')
#   arr[-1] = "#{word} #{arr.last}" if arr.size > 1
#   arr.join(delimiter)
# end

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt("Choose a square: #{joiner(empty_squares(brd))}")
    # prompt("Choose a square: #{joiner(empty_squares(brd), SEPARATOR)}")
    prompt("Choose a square: #{joinor(empty_squares(brd), SEPARATOR, END_WORD)}")
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

def check_winner(brd, line, marker)
  # brd.values_at(line[0], line[1], line[2]).count(marker) == 3
  brd.values_at(*line).count(marker) == 3
end

def detect_winner(brd)
  if WINNING_LINES.find { |line| check_winner(brd, line, PLAYER_MARKER) }
    "Player"
  elsif WINNING_LINES.find { |line| check_winner(brd, line, COMPUTER_MARKER) }
    "Computer"
  end
end

def board_full?(brd)
  empty_squares(brd).empty? # same as empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd) # !! (bang bang) forces return string to boolean.
end

# Bonus 2: Added scoring.
def update_scores(winner, scores)
  winner == "Player" ? scores[PLAYER] += 1 : scores[COMPUTER] += 1
  scores
end

def update_comment(winner, scores)
  scores.include?(MAX_SCORE) ? "#{winner} wins the Game!" : "#{winner} won the round!"
end

scores = [0, 0]
loop do
  board = initialize_board
  loop do
    display_board(board, scores)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, scores)
  if someone_won?(board)
    winner = detect_winner(board)
    scores = update_scores(winner, scores)
    comment = update_comment(winner, scores)
  else
    comment = "It's a tie!"
  end

  display_board(board, scores, comment)
  display
  prompt "Play again? (y or n)."
  continue = gets.chomp.downcase
  break if continue.start_with?("n")
  scores = [0, 0] if scores.include?(MAX_SCORE)
end

prompt "Goodbye, thanks for playing!"
