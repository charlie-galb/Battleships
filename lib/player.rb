class Player

    attr_reader :board, :unpositioned_ships

    def initialize(unpositioned_ships = [Carrier.new, Destroyer.new])
        @board = Array.new(8) {Array.new(8)}
        @unpositioned_ships = unpositioned_ships
        @active_ships = []
    end

    def position_ship(ship, y_index, x_index)
        @board[y_index][x_index] = ship
        @unpositioned_ships.delete(ship)
    end

end