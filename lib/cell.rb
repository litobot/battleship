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

  def render(reveal_ship = false)
    if !@ship.nil?
      if @fired_upon
        if @ship.health > 0
          "H" # Hit but not sunk
        else
          "X" # Sunk
        end
      elsif reveal_ship
        "S" # Ship present but not fired upon, revealed voluntarily
      else
        "." # Ship present but not revealed
      end
    elsif @fired_upon
      "M" # Miss
    else
      "." # Empty cell or ship hidden
    end
  end
  
  
end