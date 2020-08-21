require 'colorize'
# string.colorize(:color)
class Tile
    attr_reader :given
    attr_accessor :num
    def initialize(num)
        @num = num
        if num == 0
            @given = false
        else
            @given = true
        end
    end
end