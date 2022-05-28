
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    index = input.to_i - 1
end

def move(array, index, value)
    array[index] = value
    return array
end

def position_taken? (board, index)
    if board[index] == nil || board[index] == " " || board[index] == ""
        false
    else
        true
    end
end

def valid_move? (board, index)
    if index >= 0 && index <= 8 && position_taken?(board, index) == false
        return true
    else
        false
    end
end

def turn_count(board)
    count = 0
    board.each do |spot|
        if spot == "X" || spot == "O"
            count += 1
        end
    end
    return count
end

def current_player(board)
    if turn_count(board) % 2 == 0
        "X"
    else 
        "O"
    end
end

def turn(board)
    loop do
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(board, index) == true
            move(board, index, current_player(board))
            display_board(board)
            break
        end
    end
end

  def won?(board)
    WIN_COMBINATIONS.each do |combination|
      if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board, combination[2]) == true
      return combination
      end
    end
    nil
  end
      
  def full?(board)
    all_filled = board.all? do |spot|
      spot == "X" || spot == "O"
    end
  end
  
  def draw?(board)
    if full?(board) == true && won?(board) == nil
      return true
    else
      false
    end
  end
  
  def over?(board)
    if draw?(board) == true || won?(board) != nil
      return true
    else
      false
    end
  end
  
  def winner(board)
    if won?(board) != nil
      combination = won?(board)
      return board[combination[0]]
    else
      nil
    end
   end

puts "Welcome to Tic Tac Toe!"

def play(board)
    {turn(board) won?(board)}until over?(board)
        if won?(board)
            puts "Congratulations #{winner(board)}!"
        elsif draw?(board)
            puts "Cat's Game!"
        end
end