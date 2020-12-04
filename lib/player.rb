require_relative 'carrier'
require_relative 'destroyer'

class Player

    attr_reader :board, :unpositioned_ships

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
        @unpositioned_ships.delete(ship)
    end

    private 

    def position_horizontally(ship, y_index, x_index)
        upper_index = x_index + ship.size - 1
        raise_error_if_ship_off_board(upper_index)
        squares_to_occupy = (x_index..upper_index).to_a
        squares_to_occupy.each{ |square| @board[y_index][square] = ship if square < 8 }
    end

    def position_vertically(ship, y_index, x_index)
        upper_index = y_index + ship.size - 1
        raise_error_if_ship_off_board(upper_index)
        squares_to_occupy = (y_index..upper_index).to_a
        squares_to_occupy.each{ |square| @board[square][x_index] = ship if square < 8 }
    end

    def raise_error_if_ship_off_board(upper_index)
        return raise "Not enough space to put your ship here!" if upper_index > 7 
    end

end