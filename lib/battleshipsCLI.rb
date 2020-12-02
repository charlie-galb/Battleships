require 'thor'
require_relative 'player'

class BattleshipsCLI < Thor

    desc "new_game", "Start a new game of battleships!"

    def new_game(number_of_players=1)
        player_1 = Player.new
        puts player_1.board
        puts player_1.unpositioned_ships
    end

end

BattleshipsCLI.start(ARGV)