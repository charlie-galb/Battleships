require 'game'

describe 'Features' do
    it'can play out a single player game' do
        game = Game.new
        expect(game.player_1).to be_instance_of Player
        expect(game.player_2).to be_instance_of Player
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
        game.position_ships(game.player_1)
        expect(game.player_1.unpositioned_ships).to be_empty
        expect(game.player_1.board[4][3]).to be_instance_of Destroyer
        expect(game.player_1.board[5][3]).to be_instance_of Destroyer
        expect(game.player_1.board[6][3]).to be_instance_of Destroyer
        expect(game.player_1.board[1][0]).to be_instance_of Carrier
        expect(game.player_1.board[1][3]).to be_instance_of Carrier
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
        game.position_ships(game.player_2)
        io = StringIO.new
        io.puts"4"
        io.puts"3"
        io.rewind
        $stdin = io
        p game.player_2.board[4]
        game.player_1_take_turn 
        p game.player_2.board[4]
        expect(game.player_2.board[4][3]).to eq "X"
        io.rewind
        $stdin = io
        game.player_2_take_turn
        expect(game.player_1.board[4][3]).to eq "X"
        $stdin = STDIN
    end
end