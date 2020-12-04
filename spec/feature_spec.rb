require 'game'

describe 'Features' do
    it'can play out a single player game' do
        game = Game.new
        io = StringIO.new
        io.puts"1"
        io.rewind
        $stdin = io
        game.enter_number_of_players
        expect(game.player_1).to be_instance_of Player
        io = StringIO.new
        io.puts"1"
        io.puts"Vertical"
        io.puts"4"
        io.puts"3"
        io.puts"0"
        io.puts"Horizontal"
        io.puts"1"
        io.puts"0"
        io.rewind
        $stdin = io
        game.player_1_position_ships
        expect(game.player_1.unpositioned_ships).to be_empty
        expect(game.player_1.board[4][3]).to be_instance_of Destroyer
        expect(game.player_1.board[5][3]).to be_instance_of Destroyer
        expect(game.player_1.board[6][3]).to be_instance_of Destroyer
        expect(game.player_1.board[1][0]).to be_instance_of Carrier
        expect(game.player_1.board[1][3]).to be_instance_of Carrier
        $stdin = STDIN
    end
end