class MoveNode
    attr_reader :x, :y, :moves, :parent, :repeat_squares
    @@repeat_squares = []
    def initialize(x,y,parent=nil)
        @x = x; @y = y
        @parent = parent
        @moves = possible_moves
        @@repeat_squares << [@x,@y]
    end
    private
    def possible_moves()
        x = @x; y = @y
        moves = [[x+1,y+2], [x-1,y+2], [x+1,y-2],  [x-1,y-2],
                 [x+2,y+1], [x-2,y+1], [x+2,y-1], [x-2,y-1]]
        pos_moves = []
        moves.each do |move|
            pos_moves << move if ((square?(move)) and !@@repeat_squares.include?(move))
        end
        return pos_moves
    end 
end
def knight_moves(square1,square2)
    return false unless (square?(square1) and square?(square2) and square1!=square2)
    pos_moves = [MoveNode.new(square1[0],square1[1])]
    count = 1
    while count <=20
        roots = pos_moves
        pos_moves = []
        roots.each do |root|
            root.moves.each do |move|
                return to_st(MoveNode.new(move[0],move[1],root),count) if move == square2
                pos_moves << MoveNode.new(move[0],move[1],root)
            end
        end
        count += 1
    end
end
def square?(square)
    rng = (0..7).to_a
    return (rng.include?square[0] and rng.include?square[1])
end
def to_st(node,moves)
    return node.parent==nil ? "Completed in #{moves} moves!\n#{node.x},#{node.y}" : "#{to_st(node.parent,moves)} -> #{node.x},#{node.y}"
end