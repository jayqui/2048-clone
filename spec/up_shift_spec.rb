require_relative '../app/models/game'

describe 'UpShift' do

  let(:game) { Game.new }

  describe '#shift_element_up' do
    context 'when the element can move and is not a 0' do
      context 'when it is at a middle index' do
        it 'shifts the element up' do
          board_before = [ [0,0,0,0],
                           [0,2,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

          board_after =  [ [0,2,0,0],
                           [0,0,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

          transformed_board = game.shift_element_up(board: board_before, row_number: 1, column_number: 1)
          expect(transformed_board).to eq(board_after)
        end
      end

      context 'when it is at the 0 index' do
        it 'does nothing' do
          board_before = [ [0,2,0,0],
                           [0,0,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

          transformed_board = game.shift_element_up(board: board_before, row_number: 0, column_number: 1)
          expect(transformed_board).to eq(board_before)
        end
      end

      context 'when it is at the last index' do
        it 'shifts the element up' do
          board_before = [ [0,0,0,0],
                           [0,0,0,0],
                           [0,0,0,0],
                           [0,2,0,0], ]

          board_after =  [ [0,0,0,0],
                           [0,0,0,0],
                           [0,2,0,0],
                           [0,0,0,0], ]

          transformed_board = game.shift_element_up(board: board_before, row_number: 3, column_number: 1)
          expect(transformed_board).to eq(board_after)
        end
      end

    end
    context 'when the element cannot move or is a 0' do
      context 'when the element cannot move' do
        it 'does nothing' do
          board_before = [ [0,0,0,0],
                           [0,2,0,0],
                           [0,4,0,0],
                           [0,0,0,0], ]

          transformed_board = game.shift_element_up(board: board_before, row_number: 2, column_number: 1)
          expect(transformed_board).to eq(board_before)
        end
      end

      context 'when the element is a 0' do
        it 'does nothing' do
          board_before = [ [0,0,0,0],
                           [0,2,0,0],
                           [0,4,0,0],
                           [0,0,0,0], ]

          transformed_board = game.shift_element_up(board: board_before, row_number: 3, column_number: 1)
          expect(transformed_board).to eq(board_before)
        end
      end
    end
  end

  describe '#combine_elements_up' do
    it 'combines adjacent, same-valued elements above' do
      board_before_1 = [ [0,2,0,0],
                         [0,2,0,0],
                         [0,0,0,0],
                         [0,0,0,0], ]

      board_after_1 =  [ [0,4,0,0],
                         [0,0,0,0],
                         [0,0,0,0],
                         [0,0,0,0], ]

      board_transformed_1 = game.combine_elements_up(board: board_before_1, column_number: 1)
      expect(board_transformed_1).to eq(board_after_1)


      board_before_2 = [ [0,8,0,0],
                         [0,4,0,0],
                         [0,4,0,0],
                         [0,0,0,0], ]

      board_after_2 =  [ [0,8,0,0],
                         [0,8,0,0],
                         [0,0,0,0],
                         [0,0,0,0], ]

      board_transformed_2 = game.combine_elements_up(board: board_before_2, column_number: 1)
      expect(board_transformed_2).to eq(board_after_2)


      board_before_3 = [ [0,8,0,0],
                         [0,0,0,0],
                         [0,4,0,0],
                         [0,4,0,0], ]

      board_after_3 =  [ [0,8,0,0],
                         [0,0,0,0],
                         [0,8,0,0],
                         [0,0,0,0], ]

      board_transformed_3 = game.combine_elements_up(board: board_before_3, column_number: 1)
      expect(board_transformed_3).to eq(board_after_3)
    end
  end

  describe '#shift_column_up_once' do
    it 'shifts a column up once' do
      board_before = [ [0,0,0,0],
                       [0,4,0,0],
                       [0,0,0,0],
                       [0,2,0,0], ]

      board_after =  [ [0,4,0,0],
                       [0,0,0,0],
                       [0,2,0,0],
                       [0,0,0,0], ]

      transformed_board = game.shift_column_up_once(board: board_before, column_number: 1)
      expect(transformed_board).to eq(board_after)
    end
  end

  describe '#shift_column_up' do
    it 'shifts a column up' do
      board_before = [ [0,0,0,0],
                       [0,4,0,0],
                       [0,0,0,0],
                       [0,2,0,0], ]

      board_after =  [ [0,4,0,0],
                       [0,2,0,0],
                       [0,0,0,0],
                       [0,0,0,0], ]

      transformed_board = game.shift_column_up(board: board_before, column_number: 1)
      expect(transformed_board).to eq(board_after)
    end

    context 'when elements can be combined upward' do
      it 'combines exactly once and finishes upward movement' do
        board_before_1 = [ [0,4,0,0],
                           [0,4,0,0],
                           [0,8,0,0],
                           [0,0,0,0], ]

        board_after_1 =  [ [0,8,0,0],
                           [0,8,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

        board_transformed_1 = game.shift_column_up(board: board_before_1, column_number: 1)
        expect(board_transformed_1).to eq(board_after_1)


        board_before_2 = [ [0,2,0,0],
                           [0,2,0,0],
                           [0,4,0,0],
                           [0,4,0,0], ]

        board_after_2 =  [ [0,4,0,0],
                           [0,8,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

        board_transformed_2 = game.shift_column_up(board: board_before_2, column_number: 1)
        expect(board_transformed_2).to eq(board_after_2)



        board_before_3 = [ [0,2,0,0],
                           [0,2,0,0],
                           [0,2,0,0],
                           [0,2,0,0], ]

        board_after_3 =  [ [0,4,0,0],
                           [0,4,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

        board_transformed_3 = game.shift_column_up(board: board_before_3, column_number: 1)
        expect(board_transformed_3).to eq(board_after_3)


        board_before_4 = [ [0,4,0,0],
                           [0,4,0,0],
                           [0,2,0,0],
                           [0,2,0,0], ]

        board_after_4 =  [ [0,8,0,0],
                           [0,4,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

        board_transformed_4 = game.shift_column_up(board: board_before_4, column_number: 1)
        expect(board_transformed_4).to eq(board_after_4)


        board_before_5 = [ [0,8,0,0],
                           [0,0,0,0],
                           [0,4,0,0],
                           [0,4,0,0], ]

        board_after_5 =  [ [0,8,0,0],
                           [0,8,0,0],
                           [0,0,0,0],
                           [0,0,0,0], ]

        board_transformed_5 = game.shift_column_up(board: board_before_5, column_number: 1)
        expect(board_transformed_5).to eq(board_after_5)

        board_before_6 = [ [0,2,0,0],
                           [0,8,0,0],
                           [0,8,0,0],
                           [0,8,0,0], ]

        board_after_6 =  [ [0,2,0,0],
                           [0,16,0,0],
                           [0,8,0,0],
                           [0,0,0,0], ]

        board_transformed_6 = game.shift_column_up(board: board_before_6, column_number: 1)
        expect(board_transformed_6).to eq(board_after_6)
      end
    end
  end

  describe '#swipe_up' do
    it 'shifts up for all columns' do
      board_before_1 = [ [2,2,4,8],
                         [2,2,4,0],
                         [4,2,2,4],
                         [4,2,2,4], ]

      board_after_1  = [ [4,4,8,8],
                         [8,4,4,8],
                         [0,0,0,0],
                         [0,0,0,0], ]

      expect(game.swipe_up(board_before_1)).to eq(board_after_1)

      board_before_2 = [ [2,8,0,4],
                         [2,0,8,8],
                         [0,0,0,0],
                         [4,8,8,8], ]

      board_after_2  = [ [4,16,16, 4],
                         [4, 0, 0,16],
                         [0, 0, 0, 0],
                         [0, 0, 0, 0], ]

      expect(game.swipe_up(board_before_2)).to eq(board_after_2)
    end
  end
end
