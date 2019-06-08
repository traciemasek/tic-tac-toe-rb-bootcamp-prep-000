WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index) 
end
  
def position_taken?(board, index)
  (board[index] == " " || board[index] == "" || board[index] == nil) ? false : true
end
  
def turn(board)
  puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, char)
      display_board(board)
    else
      turn(board)
    end 
end

def turn_count(board)
    counter = 0
    board.each do |el| 
      if el == "X" || el == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end
  
  def won?(board)
    WIN_COMBINATIONS.find do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
    end 
  end
  
  
  
  
  