require 'player'

describe Player do
    context "At the start of the game" do
        it "can place ships on the board" do
            player = Player.new;
            player.position_carrier(0, 0)
            expect(player.display_board[0][0]).to eq "carrier"
        end
    end
end