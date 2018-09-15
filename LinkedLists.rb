class LinkedList
    class Node
        attr_accessor :value, :next_node
        def initialize(next_node=nil,value=nil)
            @next_node = next_node
            @value = value
        end
    end
    def initialize(head_v=nil,tail_v=nil)
        @tail = Node.new(nil,tail_v)
        @head = Node.new(@tail,head_v)
    end
    def append(value=nil)
        @tail.next_node = Node.new(nil,value)
        @tail = @tail.next_node   
    end
    def prepend(value=nil)
        @head = Node.new(@head,value)
    end
    def size(node=@head)
        return node==@tail ? 1 : 1 + size(node.next_node)
    end
    def head
        return @head.value
    end
    def tail
        return @tail.value
    end
    def at(idx)
        return node_at(idx).value
    end
    def pop(node=@head)
        size_err
        (@tail = node; @tail.next_node = nil; return) if node.next_node == @tail
        return pop(node.next_node)
    end
    def contains?(value,node=@head)
        return true if value == node.value
        return false if node == @tail
        return contains?(value,node.next_node)
    end
    def find(value,idx=0,node=@head)
        return idx if value == node.value
        return nil if node == @tail
        return find(value,idx+1,node.next_node)
    end
    def to_s(node=@head)
        return node == @tail ? "(#{node.value}) -> nil" : "(#{node.value}) -> #{to_s(node.next_node)}"
    end
    def insert_at(idx,value=nil)
        idx_err(idx)
        node = Node.new(node_at(idx),value)
        (@head = node; return) if idx == 0
        node_at(idx-1).next_node = node
    end
    def remove_at(idx)
        idx_err(idx);size_err
        (@head = node_at(1); return) if idx == 0
        node = node_at(idx)
        prevNode = node_at(idx-1)
        (@tail = prevNode; @tail.next_node = nil; return) if node == @tail
        prevNode.next_node = node.next_node
    end
    def set_value(idx,value)
        node_at(idx).value = value
    end
    private
    def node_at(idx,node=@head)
        idx_err(idx)
        return idx == 0 ? node : node_at(idx-1,node.next_node)
    end
    def idx_err(idx)
        (puts "ERROR: Cannot index #{idx}; index out of bounds"; exit!) if (idx >= size or idx < 0)
    end
    def size_err
        (puts "ERROR: Minimum size of LinkedList object is 2"; exit!) if size<3
    end
end