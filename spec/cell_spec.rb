require './lib/ship'
require './lib/cell'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Cell do
  describe "#initialize" do
    it 'is an instance of Cell' do
      cell = Cell.new("B4")
      
      expect(cell).to be_an_instance_of(Cell)
    end
  end
  
  # it 'can place a ship' do
  #   cell = Cell.new("B4")

  #   expect(cell.ship).to eq(nil)
  # end


  # pry(main)> cell.empty?
  # # => true

  # pry(main)> cruiser = Ship.new("Cruiser", 3)
  # # => #<Ship:0x00007f84f0891238...>

  # pry(main)> cell.place_ship(cruiser) # @ship = whatever ship is coming in

  # pry(main)> cell.ship
  # # => #<Ship:0x00007f84f0891238...>

  # pry(main)> cell.empty?
  # # => false

end