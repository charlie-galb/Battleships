require_relative 'ship'

class Destroyer < Ship
    attr_reader :size
    def initialize
        @hit_count = 0
        @size = 4
    end
end