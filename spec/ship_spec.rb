require 'ship'

describe Ship do
    ship = Ship.new
    describe "#take_hit" do
        it "adds one to hit_count" do
            ship = Ship.new
            ship.take_hit
            expect(ship.hit_count).to eq 1
        end
    end
    describe "#sunk?" do
        context "when hit_count is less than size" do
            it "returns false" do
                expect(ship.sunk?).to eq false
            end
        end
        context "when hit_count is equal to or greater than size" do
            it "returns true" do
                ship.take_hit
                ship.take_hit
                expect(ship.sunk?).to eq true
            end
        end
    end
end