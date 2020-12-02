class Player

    def initialize()
        @board = Array.new(8) {Array.new(8)}
        @carrier = "carrier"
    end

    def display_board
        return @board
    end

    def position_carrier(y_index, x_index)
        @board[y_index][x_index] = @carrier
    end

end