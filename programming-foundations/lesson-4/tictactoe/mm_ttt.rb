# ttt_bonus_6.rb

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Calculate best move for computer via minimax method.
# 4. Computer marks a square.
# 5. Display the updated board state.
# 6. If winner, display winner.
# 7. If one square left for player, place player marker, goto #5
# 8. If board is full, display tie.
# 9. If neither winner nor board is full, go to #2
# 10. Play again?
# 11. If yes, go to #1
# 12. Good bye!

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
[[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
[[1, 5, 9], [3, 5, 7]].freeze

DISPLAY_OFFSET = '          '.freeze
DISPLAY_UNDERLINE =        '-----------------'.freeze
DISPLAY_DOUBLE_UNDERLINE = '================='.freeze

PLAYER = 0
COMPUTER = 1
MAX_SCORE = 1

FIRST_TO_MOVE_CHOICES = ["Player", "Computer", "Choose", "Random"].freeze
FIRST_TO_MOVE = "Choose".freeze

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
  display_intro_screen
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

def joinor(empty_squares_array, separator = ', ', end_word = 'or')
  empty_squares_array[-1] = "#{end_word} #{empty_squares_array.last}" if empty_squares_array.size > 1
  empty_squares_array.join(separator)
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "That is not a valid entry. Try again."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def find_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def minimax_square(board)
  empty_squares(board).sample
end

def computer_places_piece(brd)
  # If computer has 2 places in winning line, make it 3, if 3rd place is open.
  marker = COMPUTER_MARKER
  square = find_square(brd, marker)
  if !square # If not, check to block player
    marker = PLAYER_MARKER
    square = find_square(brd, marker)
  end
  if !square # Else, check if position 5 is empty
    square = if brd[5] == INITIAL_MARKER
      5
    else # Else, pick a best MM square for the computer piece
      minimax_square(brd)
      # else # Else, pick a random open space for the computer piece
      #   empty_squares(brd).sample
    end
  end
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

def update_scores(winner, scores)
  winner == "Player" ? scores[PLAYER] += 1 : scores[COMPUTER] += 1
  scores
end

def update_comment(winner, scores)
  scores.include?(MAX_SCORE) ? "#{winner} wins the Game!" : "#{winner} won the round!"
end

def ask_user_who_moves_first
  loop do
    prompt "Who should have the first move? 1. Player. or 2. Computer"
    user_input = gets.chomp.to_i
    if ![1, 2].include?(user_input)
      prompt "That is not a valid input. Try Again."
    else
      user_input == 1 ? (return "Player") : (return "Computer")
    end
  end
end

def determine_who_moves_first
  if FIRST_TO_MOVE == "Random"
    FIRST_TO_MOVE_CHOICES.take(3).sample # Not the last option ("Random").
  elsif FIRST_TO_MOVE == "Choose"
    ask_user_who_moves_first
  else
    FIRST_TO_MOVE # Computer or Player
  end
end

def place_piece(board, current_player)
  current_player == "Player" ? player_places_piece(board) : computer_places_piece(board)
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def last_open_square(brd)
  last_open_square = nil
  open_squares = brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  if open_squares.count == 1
    last_open_square = open_squares[0]
  end
  last_open_square
end

scores = [0, 0]
comment = ''
display_intro_screen
current_player = determine_who_moves_first

loop do # Game Loop - A Game will consist of a number of Rounds until one player reaches MAX_SCORE.
  board = initialize_board
  initial_current_player = current_player

  loop do # Loop for a single Round
    display_board(board, scores)
    if current_player == "Player" && last_open_square(board)
      board[last_open_square(board)] = PLAYER_MARKER
    else
      place_piece(board, current_player)
    end
    current_player = alternate_player(current_player)
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

  if scores.include?(MAX_SCORE)
    scores = [0, 0]
    current_player = determine_who_moves_first
  else
    current_player = initial_current_player
  end
end

prompt "Goodbye, thanks for playing!"
