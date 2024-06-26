require 'spec_helper'

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
    expect(cell.empty?).to eq(false)
  end

  it 'knows when it has been fired upon and subtracts health if ship was hit' do
    cell = Cell.new("B4")

    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)

    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)
    expect(cell.ship.health).to eq(2)
  end

  it 'Will render a string based on conditions' do
    cell_1 = Cell.new("B4")
    cell_1.render
    # binding.pry
    expect(cell_1.render).to eq(".")

    cell_1.fire_upon
    cell_1.render
    expect(cell_1.render).to eq("M")
    
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    expect(cell_1.render).to eq("H")

    cell_1.fire_upon
    cell_1.fire_upon
    expect(cell_1.render).to eq("X")

    binding.pry
  end

  it ' Will render S if we want to show a ship voluntarily' do
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)

    expect(cell_1.render(true)).to eq("S")
  end
end

