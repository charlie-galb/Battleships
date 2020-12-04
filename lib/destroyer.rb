require 'ship'

class Destroyer < Ship
    attr_reader :size
    def initialize
        @size = 4
    end
end