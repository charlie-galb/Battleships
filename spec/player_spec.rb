require 'player'

describe Player do

    let(:destroyer) {double('fake destroyer')}
    let(:carrier) {double('fake carrier')}
    let(:player_1) {Player.new([carrier, destroyer])}
    let(:player_2) {Player.new([carrier, destroyer])}

    describe "#position_ship" do
        context "At the start of the game" do
            it "can place ships horizontally on the board" do
                allow(carrier).to receive(:size).and_return(5)
                player_1.position_ship(carrier, "Horizontal", 0, 0)
                expect(player_1.board[0][0]).to eq carrier
                expect(player_1.board[0][4]).to eq carrier
                expect(player_1.active_ships).to eq [carrier]
                expect(player_1.unpositioned_ships).to eq [destroyer]
            end
            it "can place ships vertically on the board" do
                allow(destroyer).to receive(:size).and_return(4)
                player_1.position_ship(destroyer, "Vertical", 1, 0)
                expect(player_1.board[1][0]).to eq destroyer
                expect(player_1.board[3][0]).to eq destroyer
                expect(player_1.board[7][0]).to eq "O"
                expect(player_1.active_ships).to eq [destroyer]
                expect(player_1.unpositioned_ships).to eq [carrier]
            end
            it "does not allow a player to place ships horizontally off the board" do
                allow(destroyer).to receive(:size).and_return(4)
                p player_1.unpositioned_ships
                player_1.position_ship(destroyer, "Horizontal", 6, 6)
                p player_1.unpositioned_ships
                expect(player_1.unpositioned_ships).to eq [carrier, destroyer]
            end
            it "does not allow a player to place ships vertically off the board" do
                allow(destroyer).to receive(:size).and_return(4)
                player_1.position_ship(destroyer, "Horizontal", 6, 6)
                expect(player_1.unpositioned_ships).to eq [carrier, destroyer]
            end
            it "does not allow a player to place ships on top of each other" do
                allow(destroyer).to receive(:size).and_return(4)
                allow(carrier).to receive(:size).and_return(5)
                player_1.position_ship(destroyer, "Horizontal", 6, 0)
                player_1.position_ship(carrier, "Vertical", 3, 2)
                expect(player_1.unpositioned_ships).to eq [carrier]
            end
        end
    end

    describe "#fire" do
        context "when firing at another player's board" do
            it "can miss" do
                expect(player_1.fire(player_2, 0, 3)).to eq "Miss"
                expect(player_1.shots_record[0][0]).to eq "W"
                expect(player_1.shots_record[0][3]).to eq "O"
            end
            it "can hit" do
                allow(carrier).to receive(:size).and_return(5)
                allow(carrier).to receive(:take_hit)
                allow(carrier).to receive(:sunk?).and_return(false)
                player_2.position_ship(carrier, "Vertical", 0, 0)
                expect(player_1.fire(player_2, 0, 0)).to eq "Hit"
                expect(player_1.shots_record[0][0]).to eq "X"
                expect(player_1.shots_record[0][1]).to eq "W"
            end
            it "can sink a ship" do
                allow(carrier).to receive(:size).and_return(5)
                allow(carrier).to receive(:take_hit)
                allow(carrier).to receive(:sunk?).and_return(true)
                player_2.position_ship(carrier, "Vertical", 0, 0)
                player_1.fire(player_2, 0, 0)
                player_1.fire(player_2, 1, 0)
                player_1.fire(player_2, 2, 0)
                player_1.fire(player_2, 3, 0)
                expect(player_1.fire(player_2, 4, 0)).to eq "You sunk their battleship!"
                expect(player_2.board[2][0]).to eq "X"
            end
        end
    end
end