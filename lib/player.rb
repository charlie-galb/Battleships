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
        @board[y_index][x_index..upper_index] = @board[y_index][x_index..upper_index].map{ |square| square = ship}
    end

    def position_vertically(ship, y_index, x_index)
        upper_index = y_index + ship.size - 1
        squares_to_occupy = (y_index..upper_index)
        @board =  @board.each.with_index do |row, index| 
            row[x_index] = ship if squares_to_occupy.include?(index)
        end
    end

end