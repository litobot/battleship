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

    describe '#validate_placement?' do
      it 'can validate ship placement is the same as the length of ship' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)


        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["B2", "B3", "B4"])).to eq(true)
        expect(board.valid_placement?(submarine, ["C3", "C4"])).to eq(true)
      end

      it 'will deny a ship placement if coordiantes are identical' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        

        expect(board.valid_placement?(cruiser, ["A1", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["B2", "B2", "B3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C3", "C3"])).to eq(false)
      end
  end
end