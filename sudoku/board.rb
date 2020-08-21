require_relative "./tile.rb"
require 'colorize'
require 'colorized_string'
class Board
    
    attr_accessor :board
    
    def self.from_file(file)
        array = []
        file = File.open(file).readlines.map(&:chomp).each do |subarr| 
            subarray = []
            subarr.each_char.with_index do |el, index|
                subarray << Tile.new(el.to_i) 
            end
            array << subarray
        end
        array
    end

    def initialize(file)
        @board = Board.from_file(file)
    end
    
    def [](position)
        self.board[position[0]][position[1]]
    end

    def []=(position, val)
        self.board[position[0]][position[1]] = value
    end

    def position(position, val)
        p self[position]
        if !(self[position].given)
            self[position].num = val 
        end
    end

    def render
        self.board.each do |row|
            row.each do |ele|
                # print ele
                if ele.given
                    print ele.num.to_s.colorize(:red) #.colorize(:background=>:white)
                else
                    print ele.num.to_s.colorize(:background => :blue)
                end
            end
            puts 
        end
    end
    
    def solved?
        self.row? && (self.col? && self.box?)
    end
    
    def row?
        self.board.each do |row|
            hash = Hash.new(0)
            row.each do |el|
                hash[el.num] += 1
            end
            return false if hash.length != 9
        end
        true
    end

    def col?
        (0...9).each do |i|
            my_hash = Hash.new(0)
            self.board.each do |row|
                my_hash[row[i].num] += 1
            end
            if my_hash.length != 9
                return false
            end
        end

        return true
    end
    
    def box?
        i = 0
        x = 0
        while x <= 6
            while i <= 6
                hash = Hash.new(0)
                (x..x+2).each do |row| #row
                    (i..i+2).each do |col| #col
                        hash[self.board[row][col].num] +=1 
                    end
                end
                i += 3
                return false if hash.length != 9
            end
            x+= 3
        end
        true
    end
end

# board = Board.new("sudoku1.txt")
# board.render
# board.position([0,0], 9)
# p "   ----    "
# board.render


# 00 01 02 | 03 04 05 | 06 07 08
# 10 11 12 | 13 14 15 | 16 17 18
# 20 21 22 | 23 24 25 | 26 27 28

# 30 31 32 | 33
# 40 41 42 
# 50 51 52

# 60 61 62
# 70 71 72
# 80 81 82




# [0][0] [0][1] [0][2] [0][3]
# [1][0] [1][1] [1][2]
# [2][0] [2][1] [2][2]
