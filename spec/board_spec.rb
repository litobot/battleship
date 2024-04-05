require './lib/ship'
require './lib/board'
require './lib/cell'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Board do
  describe '#initialize' do
    it 'is an instance of Board' do
      board = Board.new

      expect(board).to be_an_instance_of(Board)
      binding.pry
    end
  end

  describe '#validate_coordinate?' do
    it 'can validate coordinates'
      board = Board.new

      board.validate_coordinate?("A1")

      expect(board.validate_coordinate?).to eq(true)
    end 
  end


end