class Ship
  attr_reader :ship_type, :legnth
  
  def initialize(ship_type, legnth)
    @ship_type = ship_type
    @legnth = legnth
  end
end