class BST
    class Node
        attr_accessor :left, :right
        attr_reader :value, :parent
        def initialize(value=nil,parent=nil)
            @value = value
            @parent = parent
            @left = nil
            @right = nil
        end
    end
    def initialize(arr)
        @root = place_node(arr.shift)
        arr.length.times{|i| place_node(arr[i],@root)}
    end
    def contains?(value,node=@root)
        return true if value == node.value
        return contains?(value, node.left) if (value < node.value and node.left != nil)
        return contains?(value, node.right) if (value > node.value and node.right != nil)
        return false
    end
    private
    def place_node(value,root=nil)
        return Node.new(value) if root==nil
        if value < root.value
            return place_node(value,root.left) if root.left != nil
            root.left = Node.new(value,root)
        else
            return place_node(value,root.right) if root.right != nil
            root.right = Node.new(value,root)
        end
    end
end