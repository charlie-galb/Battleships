require_relative 'carrier'
require_relative 'destroyer'

class Player

    attr_reader :board, :unpositioned_ships, :active_ships

    def initialize(unpositioned_ships = [Carrier.new, Destroyer.new])
        @board = Array.new(8) {Array.new(8) {"O"}}
        @unpositioned_ships = unpositioned_ships
        @active_ships = []
    end

    def position_ship(ship, orientation, y_index, x_index)
        if orientation.downcase == "horizontal"
           position_horizontally(ship, y_index, x_index)
        elsif orientation.downcase == "vertical"
           position_vertically(ship, y_index, x_index)
        end
    end

    def fire(enemy, y_index, x_index)
        enemy.take_fire(y_index, x_index)
    end

    def take_fire(y_index, x_index)
        if !@board[y_index][x_index].is_a?(String)
            @board[y_index][x_index].take_hit
            if @board[y_index][x_index].sunk?
                @active_ships.delete(@board[y_index][x_index])
                @board[y_index][x_index] = "X"
                return "You sunk their battleship!"
            else
                @board[y_index][x_index] = "X"
                return "Hit"
            end
        else
            return "Miss"
        end
    end

    private 

    def position_horizontally(ship, y_index, x_index)
        upper_index = x_index + ship.size - 1
        return if ship_off_board?(upper_index)
        squares_to_occupy = (x_index..upper_index).to_a
        return if horizontal_spaces_already_occupied?(squares_to_occupy, y_index)
        squares_to_occupy.each{ |square| @board[y_index][square] = ship if square < 8 }
        @active_ships << ship
        @unpositioned_ships.delete(ship)
    end

    def position_vertically(ship, y_index, x_index)
        upper_index = y_index + ship.size - 1
        return if ship_off_board?(upper_index)
        squares_to_occupy = (y_index..upper_index).to_a
        return if vertical_spaces_already_occupied?(squares_to_occupy, x_index)
        squares_to_occupy.each{ |square| @board[square][x_index] = ship if square < 8 }
        @active_ships << ship
        @unpositioned_ships.delete(ship)
    end

    def ship_off_board?(upper_index)
        upper_index > 7
    end

    def horizontal_spaces_already_occupied?(squares_to_occupy, y_index)
        space_occupied = nil
        squares_to_occupy.each do |square| 
            if @board[y_index][square] != "O" 
                space_occupied = true
            end
        end
        return space_occupied
    end

    def vertical_spaces_already_occupied?(squares_to_occupy, x_index)
        space_occupied = nil
        squares_to_occupy.each do |square| 
            if @board[square][x_index] != "O" 
                space_occupied = true
            end
        end
        return space_occupied
    end

end