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

    end
  end

  describe '#validate_coordinate?' do
    it 'can validate coordinates' do
      board = Board.new

      expect(board.validate_coordinate?("A1")).to eq(true)
      expect(board.validate_coordinate?("G7")).to eq(false)

    end 
  end


end