require 'pry'

class Game

    attr_reader :player_cruiser_coords_valid,
                :player_submarine_coords_valid

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
        end
        @cpu_board.place(@cpu_cruiser, cords)

    end

    def cpu_sub_placement(num_of_cords)
        board_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

        cords = board_cells.sample(num_of_cords)
        until @cpu_board.valid_placement?(@cpu_submarine, cords)
        cords = board_cells.sample(num_of_cords)
        end
        @cpu_board.place(@cpu_submarine, cords)
    end

    def cpu_placement
        #need coordinates, either 2 or 3
        cpu_cruiser_placement(@cpu_cruiser.length)
        cpu_sub_placement(@cpu_submarine.length)
        
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

    def player_cruiser_placement #bug: need to enter coordiantes twice
        puts "Enter the squares for the Cruiser (3 spaces) (ie: A1 A2 A3): "    
        player_cruiser_coords = gets.chomp.upcase.split(" ")
        until @player_board.valid_placement?(@player_cruiser, player_cruiser_coords)
            
            puts "Invalid placement! Please try again:"
            player_cruiser_coords = gets.chomp.upcase.split(" ")
        end 
        @player_cruiser_coords_valid = player_cruiser_coords
    end

    def player_submarine_placement #bug: need to enter coordiantes twice
        puts "Enter the squares for the subamrine (2 spaces) (ie: A1 A2): "    
        player_submarine_coords = gets.chomp.upcase.split(" ")
        until @player_board.valid_placement?(@player_submarine, player_submarine_coords)
            
            puts "Invalid placement! Please try again:"
            player_submarine_coords = gets.chomp.upcase.split(" ")
        end
        @player_submarine_coords_valid = player_submarine_coords
    end

    def play
        
        cpu_placement

        puts "I have laid out my ships on the grid. \n" \
            "You now need to lay out your two ships on the grid. \n" \
            "The Cruiser is three units long and the Submarine is two units long. \n" \
            "  1 2 3 4 \n" \
            "A #{@player_board.cells["A1"].render} #{@player_board.cells["A2"].render} #{@player_board.cells["A3"].render} #{@player_board.cells["A4"].render} \n" \
            "B #{@player_board.cells["B1"].render} #{@player_board.cells["B2"].render} #{@player_board.cells["B3"].render} #{@player_board.cells["B4"].render} \n" \
            "C #{@player_board.cells["C1"].render} #{@player_board.cells["C2"].render} #{@player_board.cells["C3"].render} #{@player_board.cells["C4"].render} \n" \
            "D #{@player_board.cells["D1"].render} #{@player_board.cells["D2"].render} #{@player_board.cells["D3"].render} #{@player_board.cells["D4"].render} \n" \
    
        player_cruiser_placement 
        @player_board.place(@player_cruiser, @player_cruiser_coords_valid)
        
        player_submarine_placement
        @player_board.place(@player_submarine, @player_submarine_coords_valid)
        
        puts "=============COMPUTER BOARD============= \n" \
            "A #{@cpu_board.cells["A1"].render} #{@cpu_board.cells["A2"].render} #{@cpu_board.cells["A3"].render} #{@cpu_board.cells["A4"].render} \n" \
            "B #{@cpu_board.cells["B1"].render} #{@cpu_board.cells["B2"].render} #{@cpu_board.cells["B3"].render} #{@cpu_board.cells["B4"].render} \n" \
            "C #{@cpu_board.cells["C1"].render} #{@cpu_board.cells["C2"].render} #{@cpu_board.cells["C3"].render} #{@cpu_board.cells["C4"].render} \n" \
            "D #{@cpu_board.cells["D1"].render} #{@cpu_board.cells["D2"].render} #{@cpu_board.cells["D3"].render} #{@cpu_board.cells["D4"].render} \n" \
            "==============PLAYER BOARD============== \n" \
            "A #{@player_board.cells["A1"].render} #{@player_board.cells["A2"].render} #{@player_board.cells["A3"].render} #{@player_board.cells["A4"].render} \n" \
            "B #{@player_board.cells["B1"].render} #{@player_board.cells["B2"].render} #{@player_board.cells["B3"].render} #{@player_board.cells["B4"].render} \n" \
            "C #{@player_board.cells["C1"].render} #{@player_board.cells["C2"].render} #{@player_board.cells["C3"].render} #{@player_board.cells["C4"].render} \n" \
            "D #{@player_board.cells["D1"].render} #{@player_board.cells["D2"].render} #{@player_board.cells["D3"].render} #{@player_board.cells["D4"].render} \n" \
    
    end
end