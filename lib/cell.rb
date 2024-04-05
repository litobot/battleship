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

  def place_ship(ship) # this may not be best
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

  def render(reveal_ship: false)
    if @ship.nil? && @fired_upon == false
      "."
    elsif @ship.nil? && @fired_upon == true
      "M"
    elsif !ship.nil? && @fired_upon == true && ship.health > 0
      "H"
    elsif !ship.nil? && @fired_upon == true && ship.health == 0
      "X"
    end
  end
end