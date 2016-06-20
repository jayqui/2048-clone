require_relative '../app/models/game'

describe 'RightShift' do

  let(:game) { Game.new }

  describe '#shift_element_right' do

    context 'when the element can move and is not a 0' do
      context 'when it is at a middle index' do
        it 'shifts an element right' do
          expect(game.shift_element_right([4,0,8,0], 2)).to eq([4,0,0,8])
        end
      end

      context 'when it is at the 0 index' do
        it 'shifts an element right' do
          expect(game.shift_element_right([4,0,8,0], 0)).to eq([0,4,8,0])
        end
      end

      context 'when it is at the last index' do
        it 'does nothing' do
          expect(game.shift_element_right([4,0,0,8], 3)).to eq([4,0,0,8])
        end
      end
    end

    context 'when the element cannot move or is a 0' do
      context 'when the element cannot move' do
        it 'does nothing' do
          expect(game.shift_element_right([0,4,8,0], 1)).to eq([0,4,8,0])
        end
      end

      context 'when the element is a 0' do
        it 'does nothing' do
          expect(game.shift_element_right([4,0,8,0], 1)).to eq([4,0,8,0])
        end
      end
    end
  end

  describe '#combine_elements_right' do
    it 'combines adjacent, same-valued elements on the right' do
      expect(game.combine_elements_right([2,2,0,0])).to eq([0,4,0,0])
      expect(game.combine_elements_right([8,4,4,0])).to eq([8,0,8,0])
      expect(game.combine_elements_right([8,0,4,4])).to eq([8,0,0,8])
      expect(game.combine_elements_right([2,2,2,2])).to eq([0,4,0,4])
    end
  end

  describe '#shift_row_right_once' do
    it 'shifts a row right once' do
      expect(game.shift_row_right_once([4,0,8,0])).to eq([0,4,0,8])
    end
  end

  describe '#shift_row_right' do
    it 'shifts a row right' do
      expect(game.shift_row_right([4,0,8,0])).to eq([0,0,4,8])
    end

    context 'when elements can be combined on the right' do
      it 'combines exactly once and finishes rightward movement' do
        expect(game.shift_row_right([4,4,8,0])).to eq([0,0,8,8])
        expect(game.shift_row_right([2,2,4,4])).to eq([0,0,4,8])
        expect(game.shift_row_right([2,2,2,2])).to eq([0,0,4,4])
        expect(game.shift_row_right([4,4,2,2])).to eq([0,0,8,4])
        expect(game.shift_row_right([8,0,4,4])).to eq([0,0,8,8])
        expect(game.shift_row_right([0,0,8,8])).to eq([0,0,0,16])
      end
    end
  end

  describe '#swipe_left' do
    it 'shifts left for all rows' do
      board_before = [ [2,2,2,2],
                       [4,4,2,2],
                       [8,0,4,4],
                       [0,0,8,8], ]

      board_after =  [ [0,0,4,4],
                       [0,0,8,4],
                       [0,0,8,8],
                       [0,0,0,16], ]

      expect(game.swipe_right(board_before)).to eq(board_after)
    end
  end
end
