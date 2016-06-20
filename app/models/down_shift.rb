module DownShift

  def shift_element_down(board:, row_number:, column_number:)
    return board if row_number == board.length - 1
    if board[row_number + 1][column_number] == 0 && board[row_number][column_number] != 0
      board[row_number + 1][column_number] = board[row_number][column_number]
      board[row_number][column_number] = 0
      @changed_column = true
    end
    board
  end

  def combine_elements_down(board:, column_number:)
    board.to_enum.with_index.reverse_each do |row, row_number|
      break if row_number == 0  # don't want to look off edge
      if board[row_number][column_number] == board[row_number - 1][column_number] && board[row_number][column_number] != 0
        board[row_number][column_number] += board[row_number - 1][column_number]
        board[row_number - 1][column_number] = 0
        @changed_column = true
      end
    end
    board
  end

  def shift_column_down_once(board:, column_number:)
    @changed_column = false
    board.each_index do |row_number|
      shift_element_down(board: board, row_number: row_number, column_number: column_number)
    end
    board
  end

  def shift_column_down(board:, column_number:)
    combine_elements_down(board: board, column_number: column_number)
    loop do
      shift_column_down_once(board: board, column_number: column_number)
      break if !@changed_column
    end
    board
  end

  def swipe_down(board)
    board.first.each_index do |column_number|
      shift_column_down(board: board, column_number: column_number)
    end
    board
  end

end
