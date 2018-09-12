#Square class so all win vectors (rows, columns, diagonals) can point to the same objects to avoid redundancy
class Square
    attr_accessor :fill
    def initialize
        @fill = "-"
    end
end

#Win vector contains a list of square objects where, if all filled by either x's or o's,
#will return the winner through winner function
class WinVec
    def initialize(squares)
        @squares = squares
    end
    def winner
        return "O" if @squares.all? {|square| square.fill=="O"}
        return "X" if @squares.all? {|square| square.fill=="X"}
        return 0
    end
end

#Row inherits winner function from WinVec; squares can be read for ease of creating other win vectors
class Row < WinVec
    attr_reader :squares
    def initialize
        @squares = []
        3.times {|i| @squares << Square.new}
    end
end

#Class used to control the game containing all win vectors
class Board

    #Initialization creates all win vector instances, the first three of which are row objects
    def initialize
        @win_vecs = []

        #Creates rows
        3.times {|i| @win_vecs << Row.new}

        #Creates columns
        3.times do |i|
            colSquares = []
            3.times {|j|colSquares << @win_vecs[j].squares[i]}
            @win_vecs << WinVec.new(colSquares)
        end

        #Creates diagonals
        diag1Squares = []
        3.times {|i| diag1Squares << @win_vecs[i].squares[i]}
        @win_vecs << WinVec.new(diag1Squares)
        diag2Squares = []
        3.times {|i| diag2Squares << @win_vecs[i].squares[2-i]}
        @win_vecs << WinVec.new(diag2Squares)
    end

    #Checks to see if any of the win vectors have triggered a win condition
    def check_win
        @win_vecs.each {|vec| return vec.winner if vec.winner != 0}
        return 0
    end

    #Displays the board and number layout
    def disp
        3.times do |i|
            chars = []
            @win_vecs[i].squares.each {|square| chars << square.fill}

            #Everything after the tab character is just a lazy way of writing the helper display,
            #the numbers 1-9 in three rows
            puts("#{chars.join}\t#{3*i+1}#{3*i+2}#{3*i+3}")
        end
    end

    #Actually fills the square
    def make_move(square,char)
        @win_vecs[(square-1)/3].squares[(square-1)%3].fill=char
    end

    #Checks whether the square has already been filled
    def check_move(square)
        return @win_vecs[(square-1)/3].squares[(square-1)%3].fill=="-"
    end
end

def main
    board = Board.new
    board.disp

    #Whether it is X's turn
    x = true
    winner = 0
    turnCount = 0
    until winner != 0 or turnCount == 9

        #Assign the player string
        player = x ? "X" : "O"
        puts "#{player}'s turn; enter a square!'"

        #Take user input, make sure it's an empty square
        square = gets.chomp.to_i
        until (1..9).to_a.include?square and board.check_move(square)
            puts "Enter an empty square number from 1-9 please."
            square = gets.chomp.to_i
        end
        board.make_move(square,player)
        board.disp

        #Change turns; assign a winner if one exists, otherwise increment the turn count and restart
        x = x ? false : true
        winner = board.check_win
        turnCount += 1 if winner == 0
    end
    puts (turnCount == 9 ? "Draw!" : "Winner is #{winner}'s'")
end

#Execute and exit
main
