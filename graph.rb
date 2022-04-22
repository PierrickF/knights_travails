# frozen_string_literal: false

require_relative 'node'

class Graph
  attr_accessor :nodes

  def initialize(board)
    @board = board
    @nodes = []

    board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        # create a node
        node = Node.new([row_index, col_index])
        print "Adding #{node.position}\n"
        nodes.push(node)
        # find their neighbors
        if (row_index-1 >= 0) &&
        (row_index-1 <= 7) &&
        (col_index-2 >= 0) &&
        (col_index-2 <= 7)
          node.neighbors.push([row_index-1,col_index-2])
        end

        if (row_index-1 >= 0) &&
        (row_index-1 <= 7) &&
        (col_index+2 >= 0) &&
        (col_index+2 <= 7)
          node.neighbors.push([row_index-1,col_index+2])
        end

        if (row_index+1 >= 0) &&
        (row_index+1 <= 7) &&
        (col_index+2 >= 0) &&
        (col_index+2 <= 7)
          node.neighbors.push([row_index+1,col_index+2])
        end

        if (row_index+1 >= 0) &&
        (row_index+1 <= 7) &&
        (col_index-2 >= 0) &&
        (col_index-2 <= 7)
          node.neighbors.push([row_index+1,col_index-2])
        end

        if (row_index-2 >= 0) &&
        (row_index-2 <= 7) &&
        (col_index-1 >= 0) &&
        (col_index-1 <= 7)
          node.neighbors.push([row_index-2,col_index-1])
        end

        if (row_index-2 >= 0) &&
        (row_index-2 <= 7) &&
        (col_index+1 >= 0) &&
        (col_index+1 <= 7)
          node.neighbors.push([row_index-2,col_index+1])
        end

        if (row_index+2 >= 0) &&
        (row_index+2 <= 7) &&
        (col_index+1 >= 0) &&
        (col_index+1 <= 7)
          node.neighbors.push([row_index+2,col_index+1])
        end

        if (row_index+2 >= 0) &&
        (row_index+2 <= 7) &&
        (col_index-1 >= 0) &&
        (col_index-1 <= 7)
          node.neighbors.push([row_index+2,col_index-1])
        end
      end
    end
  end
end
