require './lib/ship'

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

it 'has a ship_type & length' do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)

  end





  # pry(main)> cruiser.health
  # #=> 3

  # pry(main)> cruiser.sunk?
  # #=> false

  # pry(main)> cruiser.hit

  # pry(main)> cruiser.health
  # #=> 2

  # pry(main)> cruiser.hit

  # pry(main)> cruiser.health
  # #=> 1

  # pry(main)> cruiser.sunk?
  # #=> false

  # pry(main)> cruiser.hit

  # pry(main)> cruiser.sunk?
  # #=> true

end