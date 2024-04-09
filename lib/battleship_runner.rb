require './board'
require './cell'
require './ship'

def start_game 
    puts "Welcome to the Battleship Game!"
    puts 'Enter p to play. Enter q to quit.'

    start_answer = gets.chomp
    if start_answer == 'p'
        play
    elsif start_answer == 'q'
        puts "Thanks for playing!"
    end

    # Computer.play

    # cpu_cruiser = Ship.new("Cruiser", 3)
    # cpu_submarine = Ship.new("Submarine", 2)


    
    #     = set cruiser to random but valid coordinates
    #     set submarine to random but valid coordiantes
end 