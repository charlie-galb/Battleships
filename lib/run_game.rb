require_relative 'game'

game = Game.new
game.enter_number_of_players
game.player_1_position_ships
print game.player_1.board