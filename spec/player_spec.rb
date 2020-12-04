require 'player'

describe Player do

    let(:destroyer) {double('fake destroyer')}
    let(:carrier) {double('fake carrier')}

    describe "#position_ship" do
        context "At the start of the game" do
            it "can place ships horizontally on the board" do
                player = Player.new([carrier, destroyer])
                allow(carrier).to receive(:size).and_return(5)
                player.position_ship(carrier, "Horizontal", 0, 0)
                expect(player.board[0][0]).to eq carrier
                expect(player.board[0][4]).to eq carrier
                expect(player.unpositioned_ships).to eq [destroyer]
            end
            it "can place ships vertically on the board" do
                player = Player.new([carrier, destroyer])
                allow(destroyer).to receive(:size).and_return(4)
                player.position_ship(destroyer, "Vertical", 1, 0)
                expect(player.board[1][0]).to eq destroyer
                expect(player.board[3][0]).to eq destroyer
                expect(player.board[7][0]).to eq "O"
                expect(player.unpositioned_ships).to eq [carrier]
            end
            it "raises in error if a player tries to place ships horizontally off the board" do
                player = Player.new([carrier, destroyer])
                allow(destroyer).to receive(:size).and_return(4)
                expect{ player.position_ship(destroyer, "Vertical", 6, 0)}.to raise_error  "Not enough space to put your ship here!"
                expect(player.unpositioned_ships).to eq [carrier, destroyer]
            end
            it "raises in error if a player tries to place ships vertically off the board" do
                player = Player.new([carrier, destroyer])
                allow(destroyer).to receive(:size).and_return(4)
                expect{ player.position_ship(destroyer, "Horizontal", 6, 6)}.to raise_error  "Not enough space to put your ship here!"
                expect(player.unpositioned_ships).to eq [carrier, destroyer]
            end
        end
    end
end