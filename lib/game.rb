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
            puts "Vertical or horizontal?"
            orientation = gets.chomp
            puts "Where on the y-axis would you like to place it?"
            y_index = gets.chomp
            puts "Where on the x-axis would you like to place it?"
            x_index = gets.chomp
            ship = player_1.unpositioned_ships[ship_index.to_i]
            @player_1.position_ship(ship, orientation, y_index.to_i, x_index.to_i)
        end
    end
end