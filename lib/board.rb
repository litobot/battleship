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

  def validate_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, placement)

    # Check if every coordinate in the placement array is valid.
    placement.all? { |coordinate| validate_coordinate?(coordinate) }

    # Check for duplicate coordinates.
    return false unless placement.size == placement.uniq.size

    # First, check if the placement length matches the ship's length.
    return false unless ship.length == placement.size

    rows, cols = placement.map { |coord| [coord[0], coord[1..-1]] }.transpose

    # Check if either all rows are the same (vertical placement) or all columns are the same (horizontal placement).
    if rows.uniq.size == 1
      # Vertical placement, check consecutive columns.
      consecutive_columns?(cols)
    elsif cols.uniq.size == 1
      # Horizontal placement, check consecutive rows.
      consecutive_rows?(rows)
    else
      # Neither all rows nor all columns are the same, so it's not a valid placement.
      false
    end

  end

  def consecutive_rows?(rows)
    # Convert row letters to numbers to check if they are consecutive.
    row_nums = rows.map { |row| row.ord }
    row_nums.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def consecutive_columns?(cols)
    # Check if columns are consecutive numbers.
    cols.map(&:to_i).each_cons(2).all? { |x, y| y == x + 1 }
  end

  def place(ship, cells)
    cells.each do |coordinate|
      @cells[coordinate].place_ship(ship)
      # I used GPT to help me with this.  I don't know if we should use this
        # until we understand it fully.  I don't get it yet, even though I knew
        # we needed an enumerable to solve this.
          # I think it basically iterates over each array element passed in `cells`
            # and calls the #place_ship method to put the ship object in each one.
    end
    # How to get cell_1, cell_2, cell_3 to hold `cruiser` value?
  
    # This method assigns the ship to all of the cells it will occupy
      # These are passed as an array through the `cells` argument.
    
    # ACTUALLY....
    # Before #place is called, the value of the variable cell_1 == "A1" 
      # "A1" is the key in the @cells hash that holds a Cell object.
    # We need to reassign the key value from each coordinate value from the @cells
      # hash to = the Ship object we're passing in (cruiser).
    
    # We need an enumerable to do this.
  end

  
end

