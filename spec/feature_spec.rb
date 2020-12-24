require 'game'

describe 'Features' do
    it'can play out a single player game if the players act as expected' do
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
        io.rewind
        $stdin = io
        game.position_ships(game.player_2)
        io = StringIO.new
        io.puts"4"
        io.puts"3"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        expect(game.player_2.board[4][3]).to eq "X"
        expect(game.player_2.board[6][5]).to eq "O"
        io.rewind
        game.player_2_take_turn
        expect(game.player_1.board[4][3]).to eq "X"
        expect(game.player_2.board[6][5]).to eq "O"
        io = StringIO.new
        io.puts"5"
        io.puts"3"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"6"
        io.puts"3"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"7"
        io.puts"3"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"1"
        io.puts"1"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"1"
        io.puts"2"
        io.rewind
        $stdin = io
        game.player_1_take_turn
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"1"
        io.puts"3"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"1"
        io.puts"4"
        io.rewind
        $stdin = io
        game.player_1_take_turn 
        io.rewind
        game.player_2_take_turn
        io = StringIO.new
        io.puts"1"
        io.puts"0"
        io.rewind
        $stdin = io
        expect{game.player_1_take_turn}.to  output(/Player 1 wins!/).to_stdout
        expect(game.player_2.board[1][0]).to eq "X"
        expect(game.player_2.board[1][0]).to eq "X"
        $stdin = STDIN
    end

    it 'reiterates choose ship commands until the player enters a valid value' do
        game = Game.new
        io = StringIO.new
        io.puts"blancmange"
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
        expect{game.position_ships(game.player_1)}.to_not raise_error
    end
end