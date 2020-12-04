require 'ship'

class Carrier < Ship
    attr_reader :size
    def initialize
        @size = 5
    end
end