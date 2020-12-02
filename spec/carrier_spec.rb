require 'carrier'

describe Carrier do 
    it "can return its size" do
        destroyer = Carrier.new
        expect(destroyer.size).to eq 5
    end
end