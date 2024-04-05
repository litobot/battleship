class Cell

  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
    # want to show `false` once ship is placed
  end

  def place_ship(ship) # this may not be best
    @ship = ship
  end
end