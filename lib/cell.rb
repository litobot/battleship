class Cell

  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !@ship.nil?
      @fired_upon = true
      @ship.hit
    else
      @fired_upon = true
    end
  end

  def render(reveal_ship = false)
    if !empty? && fired_upon && @ship.sunk?
      "X"
    elsif !empty? && fired_upon 
      "H"
    elsif empty? && fired_upon
      "M"
    elsif reveal_ship && !empty?
      "S"
    else 
      "."
    end
  end
end