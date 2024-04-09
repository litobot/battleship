require "./lib/ship.rb"
require "./lib/board.rb"
require "./lib/cell.rb"
require "./lib/game.rb"
require 'pry'

game = Game.new
game.start 

# puts "Welcome to the Battleship Game!"
# puts 'Enter p to play. Enter q to quit.'




# def play
# # CPU Placement phase
#     # Computer.play

#     # cpu_cruiser = Ship.new("Cruiser", 3)
#     # cpu_submarine = Ship.new("Submarine", 2)

#     # = set cruiser to random but valid coordinates
#     # set submarine to random but valid coordiantes

# # Player Placement phase
# puts "I have laid out my ships on the grid. \n" \
#        "You now need to lay out your two ships on the grid. \n" \
#        "The Cruiser is three units long and the Submarine is two units long. \n" \
#        "  1 2 3 4 \n" \
#        "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" \
#        "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" \
#        "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" \
#        "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n" \
#        "Enter the squares for the Cruiser (3 spaces) (ie: A1 A2): "
#        player1_cruiser_coords = gets.chomp
#        player1_cruiser_coords_valid = player1_cruiser_coords.split
#        player1_cruiser = Ship.new("Cruiser", 3)
#        board.place(player1_cruiser, player1_cruiser_coords_valid)


#     # Player Ship Placement
#     #
# end

# start_answer = gets.chomp
# if start_answer == 'p'
#     play
# elsif start_answer == 'q'
#     puts "Thanks for playing!"
# end