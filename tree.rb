# frozen_string_literal: false

require_relative 'node'

class Tree
  #attr_accessor :board

  def initialize(board)
    @board = board
  end

  def build
    board.each do |row|
      row.each do |slot|
        # create a node
        root = Node.new
        root.position = [board.index(row), row.index(slot)]
        # find their neighbors
        if (board[root.position[0]-1][root.position[1]-2]) &&
        (root.position[0]-1 >= 0) &&
        (root.position[1]-2 >= 0)
          root.neighbors.push([root.position[0]-1,root.position[1]-2])
        end

        if (board[root.position[0]-1][root.position[1]+2]) &&
        (root.position[0]-1 >= 0) &&
        (root.position[1]+2 >= 0)
          root.neighbors.push([root.position[0]-1,root.position[1]+2])
        end

        if (board[root.position[0]+1][root.position[1]+2]) &&
        (root.position[0]+1 >= 0) &&
        (root.position[1]+2 >= 0)
          root.neighbors.push([root.position[0]+1,root.position[1]+2])
        end

        if (board[root.position[0]+1][root.position[1]-2]) &&
        (root.position[0]+1 >= 0) &&
        (root.position[1]-2 >= 0)
          root.neighbors.push([root.position[0]+1,root.position[1]-2])
        end

        if (board[root.position[0]-2][root.position[1]-1]) &&
        (root.position[0]-2 >= 0) &&
        (root.position[1]-1 >= 0)
          root.neighbors.push([root.position[0]-2,root.position[1]-1])
        end

        if (board[root.position[0]-2][root.position[1]+1]) &&
        (root.position[0]-2 >= 0) &&
        (root.position[1]+1 >= 0)
          root.neighbors.push([root.position[0]-2,root.position[1]+1])
        end

        if (board[root.position[0]+2][root.position[1]+1]) &&
        (root.position[0]+2 >= 0) &&
        (root.position[1]+1 >= 0)
          root.neighbors.push([root.position[0]+2,root.position[1]+1])
        end

        if (board[root.position[0]+2][root.position[1]+1]) &&
        (root.position[0]+2 >= 0) &&
        (root.position[1]+1 >= 0)
          root.neighbors.push([root.position[0]+2,root.position[1]-1])
        end
      end
    end
  end
end
