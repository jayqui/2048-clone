module UpShift

  def shift_element_up(board:, row_number:, column_number:)
    return board if row_number == 0
    if board[row_number - 1][column_number] == 0 && board[row_number][column_number] != 0
      board[row_number - 1][column_number] = board[row_number][column_number]
      board[row_number][column_number] = 0
      @changed_column = true
    end
    board
  end

  def combine_elements_up(board:, column_number:)
    board.each_index do |row_number|
      break if row_number == board.length - 1  # don't want to look off edge
      if board[row_number][column_number] == board[row_number + 1][column_number] && board[row_number][column_number] != 0
        board[row_number][column_number] += board[row_number + 1][column_number]
        board[row_number + 1][column_number] = 0
        @changed_column = true
      end
    end
    board
  end

  def shift_column_up_once(board:, column_number:)
    @changed_column = false
    board.each_index do |row_number|
      shift_element_up(board: board, row_number: row_number, column_number: column_number)
    end
    board
  end

  def shift_column_up(board:, column_number:)
    combine_elements_up(board: board, column_number: column_number)
    loop do
      shift_column_up_once(board: board, column_number: column_number)
      break if !@changed_column
    end
    board
  end

  def swipe_up(board)
    board.first.each_index do |column_number|
      shift_column_up(board: board, column_number: column_number)
    end
    board
  end

end
