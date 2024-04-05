require './lib/ship'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Ship do

  describe "#initialize" do
  it 'is an instance of Ship' do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser).to be_an_instance_of(Ship)
  end
end

  describe "Ship attributes" do
    it 'has a ship_type & length' do
      cruiser = Ship.new("Cruiser", 3)
      
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
    end
    
    it 'has health' do
      cruiser = Ship.new("Cruiser", 3)
      
      expect(cruiser.health).to eq(3)
    end
  end
  
  it 'can be hit and/or sunk' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
  
    expect(cruiser.health).to eq(2)

    cruiser.hit
  
    expect(cruiser.health).to eq(1)
  
    expect(cruiser.sunk?).to eq(false)
  
    cruiser.hit
  
    expect(cruiser.sunk?).to eq(true)
  end
end