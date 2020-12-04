require_relative 'ship'

class Carrier < Ship
    attr_reader :size
    def initialize
        @hit_count = 0
        @size = 5
    end
end