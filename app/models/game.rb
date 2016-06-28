require_relative 'left_shift'
require_relative 'right_shift'
require_relative 'up_shift'
require_relative 'down_shift'

class Game
  include LeftShift
  include RightShift
  include UpShift
  include DownShift

  attr_reader :board, :new_piece_coordinates, :collision_points

  NEW_PIECES = [2,2,2,2,4] # randomly sample from this

  def initialize
    @board = [ [0,0,0,0],
               [0,0,0,0],
               [0,0,0,0],
               [0,0,0,0], ]
    @changed_row = nil
    @changed_column = nil
    @collision_points = []

    2.times { randomly_fill_empty_space }
  end

  def game_over?
    !any_empty_spaces_left? && !any_contiguous_combinables?
  end

  def left
    @collision_points = []
    original_board = Marshal.load(Marshal.dump(board)) # deep duplication of the multi-dimensional array
    swipe_left(board)
    randomly_fill_empty_space unless board == original_board
  end

  def right
    @collision_points = []
    original_board = Marshal.load(Marshal.dump(board)) # deep duplication of the multi-dimensional array
    swipe_right(board)
    randomly_fill_empty_space unless board == original_board
  end

  def up
    @collision_points = []
    original_board = Marshal.load(Marshal.dump(board)) # deep duplication of the multi-dimensional array
    swipe_up(board)
    randomly_fill_empty_space unless board == original_board
  end

  def down
    @collision_points = []
    original_board = Marshal.load(Marshal.dump(board)) # deep duplication of the multi-dimensional array
    swipe_down(board)
    randomly_fill_empty_space unless board == original_board
  end

  private

  attr_writer :board

  def randomly_fill_empty_space
    rand_row, rand_column = rand(4), rand(4)
    until board[rand_row][rand_column] == 0
      rand_row, rand_column = rand(4), rand(4)
    end
    @new_piece_coordinates = [rand_row, rand_column]
    board[rand_row][rand_column] = NEW_PIECES.sample
  end

  def any_empty_spaces_left?
    board.each do |row|
      row.each do |ele|
        return true if ele == 0
      end
    end
    false
  end

  def any_contiguous_combinables?
    # scan rows
    board.each do |row|
      row.each_index do |column_number|
        break if column_number == row.length - 1
        return true if row[column_number] == row[column_number + 1]
      end
    end

    # scan columns
    board.first.each_index do |column_number|
      board.each_index do |row_number|
        break if row_number == board.length - 1
        return true if board[row_number][column_number] == board[row_number + 1][column_number]
      end
    end

    false
  end

end
