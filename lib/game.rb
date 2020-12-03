require_relative 'player'

class Game

    attr_reader :player_1

    def initialize
        @player_1
        @player_2
    end
    
    def enter_number_of_players
        puts "Please enter the number of players"
        number_of_players = nil

        until number_of_players == "1" || number_of_players == "1"
            number_of_players = gets.chomp
        end

        @player_1 = Player.new
    end

    def player_1_position_ships

        until @player_1.unpositioned_ships.length == 0
            puts "Type the number of the ship you want to position:"
            @player_1.unpositioned_ships.each_with_index do |ship, index|
                puts "#{index}: #{ship}"
            end
            ship_index = gets.chomp
            puts "Type the coordinates, sepearated by a space, of the square where you want to position it."
            indeces = gets.chomp
            indeces.split(" ")
            ship = player_1.unpositioned_ships[ship_index.to_i]
            x_index = indeces[0].to_i
            y_index = indeces[1].to_i
            @player_1.position_ship(ship, y_index, x_index)
        end
    end


end