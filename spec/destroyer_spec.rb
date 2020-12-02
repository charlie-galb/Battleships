require 'destroyer'

describe Destroyer do 
    it "can return its size" do
        destroyer = Destroyer.new
        expect(destroyer.size).to eq 4
    end
end