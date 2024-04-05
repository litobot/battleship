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
  
  it 'shows cell coordinate' do
    cell = Cell.new("B4")
    
    expect(cell.coordinate).to eq("B4")
  end
  
  it 'can place a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    
    
    expect(cell.ship).to eq(nil)

    expect(cell.empty?).to eq(true)

    cell.place_ship(cruiser)
    
    expect(cell.place_ship(cruiser)).to eq(cruiser)
    expect(cell.ship).to eq(cruiser)
    # expect(cell.empty?).to eq(false)
  end
end