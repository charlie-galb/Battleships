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
    end
end