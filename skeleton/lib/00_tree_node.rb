require "byebug"

class PolyTreeNode

  attr_accessor :children, :parent, :value


  def initialize(value)
    @value = value 
    @parent = nil
    @children = []
  end 

  def parent=(new_parent)
    if self.parent
        parent.children = parent.children.reject { |child| child == self}
        @parent = new_parent
        if new_parent
            new_parent.children << self
        end 
    else
        @parent = new_parent
        new_parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent=(self)
    
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
        child_node.parent=(nil)
    else
        raise "child_node is not a child."
    end
  end

def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
        search_result = child.dfs(target_value)
        return search_result unless search_result.nil?
    end

    nil
end

def bfs(target_value)
    queue = [self]
    until queue.empty?
        if queue.first.value == target_value
            return queue.first
        else
            node = queue.shift
            queue += node.children
        end
    end

    nil
end
end
