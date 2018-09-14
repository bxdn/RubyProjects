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
def build_tree(arr)
    root = place_node(arr.shift)
    arr.length.times{|i| place_node(arr[i],root)}
    return root
end
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
def search(value,node)
    return node if value == node.value
    return search(value, node.left) if (value < node.value and node.left != nil)
    return search(value, node.right) if (value > node.value and node.right != nil)
    return nil
end
