require 'player'

describe Player do

    let(:destroyer) {double('fake destroyer')}
    let(:carrier) {double('fake carrier')}

    describe "#position_ship" do
        context "At the start of the game" do
            it "can place ships on the board" do
                player = Player.new([carrier, destroyer])
                player.position_ship(carrier, 0, 0)
                expect(player.board[0][0]).to eq carrier
                expect(player.unpositioned_ships).to eq [destroyer]
            end
        end
    end
end