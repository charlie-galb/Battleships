require_relative 'carrier'
require_relative 'destroyer'

class Player

    attr_reader :board, :unpositioned_ships

    def initialize(unpositioned_ships = [Carrier.new, Destroyer.new])
        @board = Array.new(8) {Array.new(8) {"O"}}
        @unpositioned_ships = unpositioned_ships
        @active_ships = []
    end

    def position_ship(ship, y_index, x_index)
        upper_index = x_index + ship.size - 1
        @board[y_index][x_index..upper_index] = @board[y_index][x_index..upper_index].map{ |square| square = ship}
        @unpositioned_ships.delete(ship)
    end

end