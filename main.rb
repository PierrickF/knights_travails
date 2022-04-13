# frozen_string_literal: false

require_relative 'node'

board = Array.new(8) { Array.new(8) { 'o' } }
previous_position = nil
def knight_move(start, destination, board, previous_position)
  # Stop recursion when arrived at destination
  return nil if start == destination

  # Create the root node
  root = Node.new(start)

  # Establish who the neighbors are (+-2 and/or +-1)
  find_neighbors(root, board)

  print "Current: #{root.position}\n\n"

  # I'lL fUcKiNG dO iT aGaIn (for each neighbor there is)
  root.neighbors.each do |neighbor|
    if neighbor == previous_position
      previous_position = root.position
      next
    else
      previous_position = root.position
      knight_move(neighbor, destination, board, previous_position)
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

knight_move([0,0], [7,7], board, previous_position)
