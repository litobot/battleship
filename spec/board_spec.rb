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

      it 'will deny a ship placement if any coordiantes are identical' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        

        expect(board.valid_placement?(cruiser, ["A1", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["B2", "B2", "B3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C3", "C3"])).to eq(false)
      end

      it 'can make sure coordinates are consecutive' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
        expect(board.valid_placement?(submarine, ["B2", "C2"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["B1", "B2", "B4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["B2", "D2"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["B1", "B1", "B2"])).to eq(false)
      end

      it 'can make sure coordinates are not diagonal' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      end

      it 'can make sure rows are consecutive' do
        board = Board.new
        rowsAB = ["A", "B"]
        rowsAD = ["A", "C"]

        expect(board.consecutive_rows?(rowsAB)).to eq(true)
        expect(board.consecutive_rows?(rowsAD)).to eq(false)

      end

      it 'can make sure columns are consecutive' do
        board = Board.new
        cols12 = ["1", "2"]
        cols13 = ["1", "3"]
        
        expect(board.consecutive_columns?(cols12)).to eq(true)
        expect(board.consecutive_columns?(cols13)).to eq(false)
        
      end
      
      it 'shows ships cannot overlap' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        
        board.place(cruiser, ["A1", "A2", "A3"])

        cell_1 = board.cells["A1"]    
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]    

        expect(cell_1.ship).to eq(cruiser)
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_3.ship == cell_2.ship).to eq(true)
      end

      it 'prevents against overlapping ship placement' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 

        # Placing the cruiser on these coordinates should render them unavailable
          # for further placement by the submarine.
        # How do we tag these coordinates as "unavailable"?
          # Do we modify the original @cells hash key/values with "S"?
            # --> So that when they are passed a second time they no longer exist??
              # --> And therefore cannot be validated?
                # Is that why we needed the bit above with cell_1/2/3?
        board.place(cruiser, ["A1", "A2", "A3"])


        # "A1" is already occupied and this attempt should return `false`.
        expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
      end
    end

    describe 'board rendering' do 
      it 'shows the board rendering' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3) 

        board.place(cruiser, ["A1", "A2", "A3"])
        
        expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      end

      it 'shows the board is registering hits ' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["B4"]
        cell_3 = board.cells["C1"]
        cell_4 = board.cells["D1"]

        board.place(cruiser, ["A1", "A2", "A3"])
        board.place(submarine, ["C1", "D1"])

        cell_1.fire_upon
        cell_2.fire_upon
        cell_3.fire_upon
        cell_4.fire_upon
          
        expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . M \nC X . . . \nD X . . . \n")
        expect(board.render(true)).to eq("  1 2 3 4 \nA H S S . \nB . . . M \nC X . . . \nD X . . . \n")
      end
    end
end