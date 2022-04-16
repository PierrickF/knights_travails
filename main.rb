# frozen_string_literal: false

require_relative 'node'

board = Array.new(8) { Array.new(8) { 'o' } }
ban_list = []
def knight_move(start, destination, board, ban_list)
  # Stop recursion when arrived at destination
  return nil if start == destination

  # Create the root node
  root = Node.new(start)

  # Establish who the neighbors are (+-2 and/or +-1)
  find_neighbors(root, board)

  print "Current: #{root.position}\n\n"

  # I'lL fUcKiNG dO iT aGaIn (for each neighbor there is)
  if root.neighbors.include?(destination)
    knight_move(destination, destination, board, ban_list)
  else
    root.neighbors.each do |neighbor|
      if ban_list.include?(neighbor)
        next
      else
        ban_list.push(root.position)
        knight_move(neighbor, destination, board, ban_list)
      end
    end
  end
end

def find_neighbors(root, board)

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

  if (board[root.position[0]+2][root.position[1]-1]) &&
  (root.position[0]+2 >= 0) &&
  (root.position[1]-1 >= 0)
    root.neighbors.push([root.position[0]+2,root.position[1]-1])
  end

  # Sanity check
  print "Neighbors: #{root.neighbors} \n"

  root.neighbors
end

knight_move([0,0], [5,6], board, ban_list)
