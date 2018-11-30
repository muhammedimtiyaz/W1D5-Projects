require_relative "00_tree_node"



class KnightPathFinder
  DIFF = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [2,-1], [1,-2]]
  def self.valid_moves(pos)
    x1, y1 = pos
    poss_moves = []
    DIFF.each do |diff_arr|
      x2, y2 = diff_arr 
      if (x1 + x2).between?(0,7) && (y1 + y2).between?(0,7)
        poss_moves << [x1 + x2, y1 + y2]
      end
    end

    poss_moves
  end

  attr_reader :root_node, :visited_positions

  def initialize(start_pos)
    build_move_tree
    @visited_positions = [start_pos]
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(start_pos)
    queue = [root_node]

    until queue.empty?
      if visited_positions.include?(queue.first.value)
        return queue.first.value 
      else 
        node = queue.shift
        queue += node.children
      end
    end
    nil
  end 

  def find_path
  end 

  def new_move_positions(pos)
    new_valid_moves = KnightPathFinder.valid_moves(pos).reject { |moves| visited_positions.include?(moves) }
    visited_positions += new_valid_moves
  end




end