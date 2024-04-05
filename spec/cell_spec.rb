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
  
  it 'can place a ship' do
    cell = Cell.new("B4")
    
    expect(cell.ship).to eq(nil)

    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    expect(cell.empty?).to eq(true)
    expect(cell.place_ship(cruiser)).to eq(cruiser) ### @ship = whatever ship is coming in
  
    # expect(cell.ship).to eq(cruiser)
  
    # pry(main)> cell.empty?
    # # => false
  end



end