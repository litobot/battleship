class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship == nil
    true
    # want to show `false` once ship is placed
  end

  def place_ship(ship) # this may not be best
    @ship = ship
  end
  
end
  
