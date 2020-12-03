require 'player'

describe Player do

    let(:destroyer) {double('fake destroyer')}
    let(:carrier) {double('fake carrier')}

    describe "#position_ship" do
        context "At the start of the game" do
            it "can place ships on the board" do
                player = Player.new([carrier, destroyer])
                allow(carrier).to receive(:size).and_return(5)
                allow(destroyer).to receive(:size).and_return(4)
                player.position_ship(carrier, "Horizontal", 0, 0)
                expect(player.board[0][0]).to eq carrier
                expect(player.board[0][4]).to eq carrier
                expect(player.unpositioned_ships).to eq [destroyer]
                player.position_ship(destroyer, "Vertical", 1, 0)
                expect(player.board[1][0]).to eq destroyer
                expect(player.board[3][0]).to eq destroyer
                expect(player.board[7][0]).to eq "O"
                expect(player.unpositioned_ships).to be_empty
            end
        end
    end
end