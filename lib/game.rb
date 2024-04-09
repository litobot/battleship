require 'pry'

class Game

    def initialize
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @player_board = Board.new
        @cpu_cruiser = Ship.new("Cruiser", 3)
        @cpu_submarine = Ship.new("Submarine", 2)
        @cpu_board = Board.new
    end


    
    def cpu_cruiser_placement(num_of_cords)
        board_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

        cords = board_cells.sample(num_of_cords)
        until @cpu_board.valid_placement?(@cpu_cruiser, cords)
        cords = board_cells.sample(num_of_cords)
        binding.pry    
        end
        
    end

    def cpu_placement
        #need coordinates, either 2 or 3
        cpu_cruiser_placement(@cpu_cruiser.length)
        
    end
    
    def start
        puts "Welcome to the Battleship Game!"
        puts 'Enter p to play. Enter q to quit.'
        
        start_answer = gets.chomp
        if start_answer == 'p'
            play
        elsif start_answer == 'q'
            puts "Thanks for playing!"
        end
    
    end

    def play
            cpu_placement
        #     Computer.play
        
        
        #     = set cruiser to random but valid coordinates
        #     set submarine to random but valid coordiantes
        
        # Player Placement phase
        # puts "I have laid out my ships on the grid. \n" \
        #        "You now need to lay out your two ships on the grid. \n" \
        #        "The Cruiser is three units long and the Submarine is two units long. \n" \
        #        "  1 2 3 4 \n" \
        #        "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" \
        #        "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" \
        #        "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" \
        #        "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n" \
        #        "Enter the squares for the Cruiser (3 spaces) (ie: A1 A2): "
        #        player_cruiser_coords = gets.chomp
        #        player_cruiser_coords_valid = player_cruiser_coords.split
            
        #        board.place(player_cruiser, player_cruiser_coords_valid)
        
        
            # Player Ship Placement
            #
    end
end