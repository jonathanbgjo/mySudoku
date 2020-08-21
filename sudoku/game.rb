require_relative "./board.rb"

class Game  
    attr_reader :board

    def initialize(file)
        @board = Board.new(file)
    end

    def play
        while !self.board.solved?
            self.board.render
            self.board.position(self.get_position, self.get_value)

        end

        print " SOLVED WOOO"
    end
    
    def get_position
        p "Enter position: "
        position = gets.chomp.split(" ")
        position[0] = position[0].to_i
        position[1] = position[1].to_i
        return position
    end
    
    def get_value
        p "Enter value: "
        value = gets.chomp.to_i
        return value
    end
end



# i changed render to hopefully print out red strings if tile.given was true
# tried running but not getting render to display grid?? nothing in terminal
#actually just realized not getting prompted to enter any numbers in terminal


game = Game.new('sudoku1.txt')
#p game.board
game.play