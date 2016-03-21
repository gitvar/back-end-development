# ttt_bonus_6.rb

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
MAX_SCORE = 5 # Should be 5
WHO_GOES_FIRST_CHOICES = ["Player", "Computer", "Ask", "Random"]
WHO_GOES_FIRST = "Ask"

def prompt(msg)
  puts "=> #{msg}"
end

def display(display_string = '')
  puts DISPLAY_OFFSET + display_string
end

def display_intro_screen
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

def joiner(empty_squares_array, separator = ', ', end_word = 'or')
  str = empty_squares_array[0]
  if empty_squares_array.count > 1
    str = empty_squares_array.join(separator)
    str[str.length - 3] = " #{end_word}"
  end
  str
end
# Bonus Feature 1:
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

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
    prompt("Choose a square: #{joiner(empty_squares(brd), SEPARATOR, END_WORD)}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "That is not a valid entry. Try again."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    # binding.pry
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  # If computer has 2 places in winning line, make it 3, if 3rd place is open.
  marker = COMPUTER_MARKER
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  if !square
    # If not, check to block player, if player has 2 places in a winning line.
    marker = PLAYER_MARKER
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, marker)
      break if square
    end
  end
  if !square
    # Else, check if position 5 is empty
    if brd[5] == INITIAL_MARKER
      square = 5
    else # pick a random open space for the computer piece
      square = empty_squares(brd).sample
    end
  end

  brd[square] = COMPUTER_MARKER
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

def board_full?(brd)
  empty_squares(brd).empty? # same as empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd) # !! (bang bang) forces return string to boolean.
end

def update_score_and_comment(board, scores, comment)
  player_or_computer = detect_winner(board)
  case player_or_computer
  when "Player"
    entity = PLAYER
  when "Computer"
    entity = COMPUTER
  else
    entity = "Error in update_score_and_comment!"
  end
  scores[entity] += 1
  if scores[entity] == MAX_SCORE
    comment = "#{player_or_computer} wins the Game!"
  else
    comment = "#{player_or_computer} won the round!"
  end

  return scores, comment
end

def ask_who_plays_first
  display_intro_screen
  current_player = ""
  loop do
    prompt "Who should have the first move? 1. Player. or 2. Computer"
    first = gets.chomp.to_i
    if ![1, 2].include?(first)
       prompt "That is not a valid input. Try Again."
    else
      if first == 1
        current_player = "Player"
      else
        current_player = "Computer"
      end
      break
    end
  end
  current_player
end

def who_goes_first
  #display_intro_screen
  current_player = ""
  if WHO_GOES_FIRST == "Random"
    current_player = WHO_GOES_FIRST_CHOICES.take(3).sample # Not last "Random"!
  elsif WHO_GOES_FIRST == "Ask"
    current_player = ask_who_plays_first
  else
    current_player = WHO_GOES_FIRST
  end
  # binding.pry
  current_player
end

def place_piece!(board, current_player)
  current_player == "Player"? player_places_piece!(board) : computer_places_piece!(board)
end

def alternate_player(current_player)
  current_player == "Player"? current_player = "Computer" : current_player = "Player"
end

scores = [0, 0]
comment = ''
current_player = who_goes_first
# binding.pry

loop do
  board = initialize_board
  # binding.pry
  # Question 6: start - to make main loop less redundant:
  loop do
    display_board(board, scores)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  # Question 6 End:

  display_board(board, scores)
  if someone_won?(board)
    scores, comment = update_score_and_comment(board, scores, comment)
  else
    comment = "It's a tie!"
  end

  display_board(board, scores, comment)
  display
  # break if scores.include?(MAX_SCORE) # Use this line if you want to stop the game after someone won MAX_SCORE round.
  prompt "Play again? (y or n)."
  continue = gets.chomp.downcase
  break if continue.start_with?("n")

  if scores.include?(MAX_SCORE)
    scores = [0, 0]
    current_player = who_goes_first
    # binding.pry
  end
end

prompt "Goodbye, thanks for playing!"
