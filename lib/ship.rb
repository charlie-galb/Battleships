class Ship

    attr_reader :hit_count

    def initialize
        @hit_count = 0
        @size = 3
    end

    def take_hit
        @hit_count += 1
    end

    def sunk?
        if @hit_count >= @size 
            true
        else
            false
        end
    end

end