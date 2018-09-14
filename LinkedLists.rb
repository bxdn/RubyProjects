class LinkedList
    attr_reader :head, :tail
    def initialize
        @tail = Node.new
        @head = Node.new(@tail)
    end
    def append
        priorTail = @tail
        @tail = Node.new
        priorTail.next_node = @tail
    end
    def prepend
        old_first = @head
        node = Node.new(nil,old_first)
        @head = node
    end
    def size(node=@head)
        return node==@tail ? 1 : 1 + size(node.next_node)
    end
    def at(idx,node=@head)
        return idx == 0 ? node : at(idx-1,node.next_node)
    end
    def pop(node=@head)
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
    def insert_at(idx)
        node = Node.new(at(idx))
        (@head = node; return) if idx == 0
        at(idx-1).next_node = node
    end
    def remove_at(idx)
        (@head = at(1); return) if idx == 0
        (@tail = at(idx-1); @tail.next_node = nil; return) if at(idx) == @tail
        at(idx-1).next_node = at(idx).next_node
    end
end
class Node
    attr_accessor :value, :next_node
    def initialize(next_node=nil)
        @value = nil
        @next_node = next_node
    end
end
