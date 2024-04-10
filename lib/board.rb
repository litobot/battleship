require_relative './cell'
require_relative './ship'

class Board

  attr_reader :cells

  def initialize
    @cells = { 
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  # Simply compares coordiate passed as argument to see if it matches values in @cells hash
  def validate_coordinate?(coordinate)
    @cells.has_key?(coordinate) && @cells[coordinate].empty?
  end
  
  def valid_placement?(ship, placement)
    
    # Checks if every coordinate in the placement array is valid (on game board).
    return false unless placement.all? { |coordinate| validate_coordinate?(coordinate) }
    
    # Ensures against duplicate coordinates.
    return false unless placement.size == placement.uniq.size

    return false unless ship.length == placement.size

    # Code splits alphanumeric coords into letter prefix and number suffix
    # to determine axial orientation and check if consecutive.
    rows, cols = placement.map { |coord| [coord[0], coord[1..-1]] }.transpose

    # Ensures ship placement not diagonal by showing provided coords on either x or y axis
    if rows.uniq.size == 1
      # Horizontal Placement - coords provided contain same letter prefix.
      consecutive_columns?(cols)
    elsif cols.uniq.size == 1
      # Vertical Placement - coords provided contain same number suffix
      consecutive_rows?(rows)
    else
      # Invalid Placement - coords provided not consistently on axis or nonconsecutive
      false
    end
  end

  def valid_shot?(coordinate)
    @cells.has_key?(coordinate)
  end

  def consecutive_rows?(rows)
    row_nums = rows.map { |row| row.ord }
    row_nums.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def consecutive_columns?(cols)
    cols.map(&:to_i).each_cons(2).all? { |x, y| y == x + 1 }
  end

  def place(ship, cells)
    # This method iterates over each array element passed in through `cells` argument
      # and calls the #place_ship method to put the ship object in each one.
    
      cells.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end

  end

  def render(show = false)
    if show == true
      "  1 2 3 4 \n" \
      "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" \
      "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" \
      "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" \
      "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n" 
      # require 'pry'; binding.pry
    else 
      "  1 2 3 4 \n" \
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" \
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" \
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" \
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n" 
    end
  end

end

