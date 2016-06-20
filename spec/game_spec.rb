require_relative '../app/models/game'

describe 'DownShift' do

  let(:game) { Game.new }

  describe '#game_over?' do
    it 'returns true if there are no empty spaces and no contiguous combinables' do
      game.instance_variable_set(:@board, [ [2,4,6,8],
                                            [8,6,4,2],
                                            [2,4,6,8],
                                            [8,6,4,2], ] )
      expect(game.game_over?).to eq(true)
    end

    it 'returns false if there are empty spaces' do
      game.instance_variable_set(:@board, [ [2,4,6,8],
                                            [8,6,4,2],
                                            [2,4,6,8],
                                            [8,6,4,0], ] )
      expect(game.game_over?).to eq(false)
    end

    it 'returns false if there are contiguous combinables' do
      game.instance_variable_set(:@board, [ [2,4,6,8],
                                            [8,6,4,2],
                                            [2,4,6,8],
                                            [8,6,4,4], ] )
      expect(game.game_over?).to eq(false)
    end
  end

  describe '#initialize' do
    it 'selects two random pieces and puts them on the board' do
      expect(Game::NEW_PIECES).to receive(:sample).exactly(2).times.and_return(2)
      expect(game.board.flatten.select {|ele| ele > 0}.count).to eq(2)
    end
  end

  describe '#left' do
    it 'moves everything left and randomly repopulates' do
      game.instance_variable_set(:@board, [ [4,2,2,2],
                                            [0,0,0,0],
                                            [0,0,0,0],
                                            [0,0,0,0], ] )

      expect(Game::NEW_PIECES).to receive(:sample).exactly(1).times.and_return(2)
      game.left
      # first row should be [4,4,2,X]
      expect(game.board.first[0]).to eq(4)
      expect(game.board.first[1]).to eq(4)
      expect(game.board.first[2]).to eq(2)
      expect(game.board.flatten.select {|ele| ele > 0}).to eq([4,4,2,2])
    end
  end

  describe '#right' do
    it 'moves everything right and randomly repopulates' do
      game.instance_variable_set(:@board, [ [2,2,2,4],
                                            [0,0,0,0],
                                            [0,0,0,0],
                                            [0,0,0,0], ] )

      expect(Game::NEW_PIECES).to receive(:sample).exactly(1).times
      game.right
      # first row should be [X,2,4,4]
      expect(game.board.first[3]).to eq(4)
      expect(game.board.first[2]).to eq(4)
      expect(game.board.first[1]).to eq(2)
    end
  end

  describe '#up' do
    it 'moves everything up and randomly repopulates' do
      game.instance_variable_set(:@board, [ [8,0,0,0],
                                            [8,0,0,0],
                                            [8,0,0,0],
                                            [2,0,0,0], ] )

      expect(Game::NEW_PIECES).to receive(:sample).exactly(1).times
      game.up
      expect(game.board[0][0]).to eq(16)
      expect(game.board[1][0]).to eq(8)
      expect(game.board[2][0]).to eq(2)
    end
  end

  describe '#down' do
    it 'moves everything down and randomly repopulates' do
      game.instance_variable_set(:@board, [ [8,0,0,0],
                                            [8,0,0,0],
                                            [8,0,0,0],
                                            [2,0,0,0], ] )

      expect(Game::NEW_PIECES).to receive(:sample).exactly(1).times
      game.down
      expect(game.board[3][0]).to eq(2)
      expect(game.board[2][0]).to eq(16)
      expect(game.board[1][0]).to eq(8)
    end
  end

end
