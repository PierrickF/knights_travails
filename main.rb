# frozen_string_literal: false

require_relative 'node'

board = Array.new(8) { Array.new(8) { 'o' } }

def knight_move(start, destination, board)
  # Stop recursion when arrived at destination
  return nil if start == destination
  # Create the root node
  root = Node.new(start)
  # Establish who the neighbors are (+-2 and/or +-1)
  find_neighbors(root, board)
  # I'lL fUcKiNG dO iT aGaIn (for each neighbor there is)
  root.neighbors.each do |neighbor|
    knight_move(neighbor, destination, board)
  end
end

def find_neighbors(root, board)
  if board[root.position[0]-1][[root.position[1]-2]]
    root.neighbors.push([[root.position[0]-1],[root.position[1]-2]])

  elsif board[root.position[0]-1][[root.position[1]+2]]
    root.neighbors.push([[root.position[0]-1],[root.position[1]+2]])

  elsif board[root.position[0]+1][[root.position[1]+2]]
    root.neighbors.push([[root.position[0]+1],[root.position[1]+2]])

  elsif board[root.position[0]+1][[root.position[1]-2]]
    root.neighbors.push([[root.position[0]+1],[root.position[1]-2]])

  elsif board[root.position[0]-2][[root.position[1]-1]]
    root.neighbors.push([[root.position[0]-2],[root.position[1]-1]])

  elsif board[root.position[0]-2][[root.position[1]+1]]
    root.neighbors.push([[root.position[0]-2],[root.position[1]+1]])

  elsif board[root.position[0]+2][[root.position[1]+1]]
    root.neighbors.push([[root.position[0]+2]],[root.position[1]+1])

  elsif board[root.position[0]+2][[root.position[1]-1]]
    root.neighbors.push([[root.position[0]+2]],[root.position[1]-1])
  end
end

knight_move([0,0], [1,2], board)
