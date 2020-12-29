require_relative 'game'

game = Game.new
game.position_ships(game.player_1)
game.position_ships(game.player_2)
while !game.winner
    game.player_1_take_turn
    game.player_2_take_turn if !game.winner 
end