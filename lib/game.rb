require_relative 'player'

class Game

    attr_reader :player_1, :player_2, :winner

    def initialize
        @player_1 = Player.new
        @player_2 = Player.new
        @winner = nil
    end

    def position_ships(player)
        until player.unpositioned_ships.length == 0
            ship_index = take_ship_index(player)
            orientation = take_orientation
            y_index = take_board_index("y-axis", player)
            x_index = take_board_index("x-axis", player)
            ship = player.unpositioned_ships[ship_index.to_i]
            player.position_ship(ship, orientation, y_index.to_i, x_index.to_i)
        end
    end

    def player_1_take_turn
        puts "Player 1, prepare to fire."
        puts "Hits: #{@player_1.shots_history[:hits]}"
        puts "Misses: #{@player_1.shots_history[:misses]}"
        puts "Enter the longitude you would like to strike."
        y_index = gets.chomp
        puts "Enter the latitude you would like to strike."
        x_index = gets.chomp
        @player_1.fire(@player_2, y_index.to_i, x_index.to_i)
        check_for_winner
    end

    def player_2_take_turn
        puts "Player 2, prepare to fire."
        puts "Shots so far..."
        puts "Hits: #{@player_2.shots_history[:hits]}"
        puts "Misses: #{@player_2.shots_history[:misses]}"
        puts "Enter the longitude you would like to strike."
        y_index = gets.chomp
        puts "Enter the latitude you would like to strike."
        x_index = gets.chomp
        @player_2.fire(@player_1, y_index.to_i, x_index.to_i)
        check_for_winner
    end

    private

    def check_for_winner
        case 
        when @player_2.active_ships.empty?
            @winner = @player_1
            puts "Player 1 wins!"
        when @player_1.active_ships.empty?
            @winner = @player_2
            puts "Player 2 wins!"
        end
    end

    def take_ship_index(player)
        valid_ship_index = false
        until valid_ship_index
            puts "Type the number of the ship you want to position:"
            player.unpositioned_ships.each_with_index do |ship, index|
                puts "#{index}: #{ship}"
            end
            ship_index = gets.chomp
            if ship_index_is_valid?(ship_index, player) 
                valid_ship_index = true
            end
        end
        return ship_index
    end

    def ship_index_is_valid?(ship_index, player)
       ship_index.to_i.to_s == ship_index && ship_index.to_i <= (player.unpositioned_ships.length - 1)
    end

    def take_orientation
        valid_orientation = false
        until valid_orientation
            puts "Vertical or horizontal?"
            orientation = gets.chomp
            if orientation_is_valid?(orientation) 
                valid_orientation = true
            end
        end
        return orientation
    end

    def orientation_is_valid?(orientation)
        orientation.downcase == "horizontal" || orientation.downcase == "vertical"
    end

    def take_board_index(axis, player)
        valid_board_index = false
        until valid_board_index
           puts "Where on the #{axis} would you like to place it (0-7)?"
            board_index = gets.chomp
            if board_index_is_valid?(board_index, player) 
                valid_board_index = true
            end
        end
        return board_index
    end

    def board_index_is_valid?(board_index, player)
       board_index.to_i.to_s == board_index && board_index.to_i <= 7
    end
end