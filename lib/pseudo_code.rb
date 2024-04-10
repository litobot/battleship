# Prevent repeat shots by both players - How to Track?
# Each player has their own hash of cells
# Each player's turn moves cell key from original hash to temp hash
# New turns must select from remaining available keys
# Game Over places keys back to each player’s respective hash


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

# Computer and Player both duplicate @cells for their own use
# Computer places ships on their board @cells_cpu = @cells
# Computer fires randomly generated shot
  # This does 2 things:

#(1).
  # Shots fired must render changes on original gameboard (@cells) as "H", "X", "M", etc.

#(2).
  # Keys from generated coordinates are stored in a separate hash to track shots fired
  # Subsequent shots must be unique from those stored in array
  # Must check respective shot_fired array in order to fire unique shot from cell hash

# Game Over empties shots_fired array for new game



# CPU TAKES SHOT

def take_shot_cpu
  board_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  shots_fired_cpu = []
  
  # Loop until a shot that hasn't been fired is selected
  loop do
    proposed_shot = board_cells.sample(1)  # Select a random cell from the board
    unless shots_fired_cpu.include?(proposed_shot)  # Check if the shot hasn't been fired yet
      shots_fired_cpu << proposed_shot  # Add the selected shot to the list of fired shots
      break  # Exit the loop if a valid shot is found
    end
  end
  
  return shots_fired_cpu  # Return the last shot fired
end


# PLAYER TAKES SHOT

def take_shot_player

  
  board_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  shots_fired_cpu = []
  
  # Loop until a shot that hasn't been fired is selected
  loop do
    proposed_shot = board_cells.sample(1)  # Select a random cell from the board
    unless shots_fired_cpu.include?(proposed_shot)  # Check if the shot hasn't been fired yet
      shots_fired_cpu << proposed_shot  # Add the selected shot to the list of fired shots
      break  # Exit the loop if a valid shot is found
    end
  end
  
  return shots_fired_cpu  # Return the last shot fired
end









# IGNORE FOR NOW
# def take_shot_cpu
#   board_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
#   shots_fired_cpu = []
#   proposed_shot = board_cells.sample(1)
#   until proposed_shot.include?(shots_fired_cpu)
#   end
#   shots_fired_cpu << successful_shot
  
# end