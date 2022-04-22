# frozen_string_literal: false

require_relative 'node'

class Graph
  attr_accessor :nodes

  def initialize(board)
    @board = board
    @nodes = []

    # loop over the board and create a node for each square
    board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        node = Node.new([row_index, col_index])
        nodes.push(node)
      end
    end

    # loop over the nodes list
    nodes.each do |node|

      # check if a neighbor can exist on the board
      if (node.position[0]-1 >= 0) &&
      (node.position[0]-1 <= 7) &&
      (node.position[1]-2 >= 0) &&
      (node.position[1]-2 <= 7)
        # if yes, find it in the nodes list
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]-1,node.position[1]-2]
            # add it as a neighbor
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]-1 >= 0) &&
      (node.position[0]-1 <= 7) &&
      (node.position[1]+2 >= 0) &&
      (node.position[1]+2 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]-1,node.position[1]+2]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]+1 >= 0) &&
      (node.position[0]+1 <= 7) &&
      (node.position[1]+2 >= 0) &&
      (node.position[1]+2 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]+1,node.position[1]+2]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]+1 >= 0) &&
      (node.position[0]+1 <= 7) &&
      (node.position[1]-2 >= 0) &&
      (node.position[1]-2 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]+1,node.position[1]-2]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]-2 >= 0) &&
      (node.position[0]-2 <= 7) &&
      (node.position[1]-1 >= 0) &&
      (node.position[1]-1 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]-2,node.position[1]-1]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]-2 >= 0) &&
      (node.position[0]-2 <= 7) &&
      (node.position[1]+1 >= 0) &&
      (node.position[1]+1 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]-2,node.position[1]+1]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]+2 >= 0) &&
      (node.position[0]+2 <= 7) &&
      (node.position[1]+1 >= 0) &&
      (node.position[1]+1 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]+2,node.position[1]+1]
            node.neighbors.push(neighbor)
          end
        end
      end

      if (node.position[0]+2 >= 0) &&
      (node.position[0]+2 <= 7) &&
      (node.position[1]-1 >= 0) &&
      (node.position[1]-1 <= 7)
        nodes.each do |neighbor|
          if neighbor.position == [node.position[0]+2,node.position[1]-1]
            node.neighbors.push(neighbor)
          end
        end
      end
    end
  end
end
