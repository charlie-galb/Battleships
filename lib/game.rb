require_relative 'player'

class Game

    attr_reader :player_1, :player_2

    def initialize
        @player_1 = Player.new
        @player_2 = Player.new
    end

    def position_ships(player)
        until player.unpositioned_ships.length == 0
            puts "Type the number of the ship you want to position:"
            player.unpositioned_ships.each_with_index do |ship, index|
                puts "#{index}: #{ship}"
            end
            ship_index = gets.chomp
            puts "Vertical or horizontal?"
            orientation = gets.chomp
            puts "Where on the y-axis would you like to place it?"
            y_index = gets.chomp
            puts "Where on the x-axis would you like to place it?"
            x_index = gets.chomp
            ship = player.unpositioned_ships[ship_index.to_i]
            player.position_ship(ship, orientation, y_index.to_i, x_index.to_i)
        end
    end

    def player_1_take_turn
        puts "Player 1, prepare to fire."
        puts "Enter the longitude you would like to strike."
        y_index = gets.chomp
        puts "Enter the latitude you would like to strike."
        x_index = gets.chomp
        @player_1.fire(@player_2, y_index.to_i, x_index.to_i)
    end

    def player_2_take_turn
        puts "Player 1, prepare to fire."
        puts "Enter the longitude you would like to strike."
        y_index = gets.chomp
        puts "Enter the latitude you would like to strike."
        x_index = gets.chomp
        @player_2.fire(@player_1, y_index.to_i, x_index.to_i)
    end
end