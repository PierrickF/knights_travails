# frozen_string_literal: false

require_relative 'node'
require_relative 'knight'

class Graph
  attr_accessor :nodes

  def initialize(board)
    @board = board
    @nodes = []

    knight = Knight.new

    # loop over the board and create a node for each square
    board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        node = Node.new([row_index, col_index])
        nodes.push(node)
      end
    end

    # make the nodes point at each other if they are neighbors
    # spiderman style
    nodes.each do |node|
      knight.find_neighbors(nodes, node, -1,-2)
      knight.find_neighbors(nodes, node, -1, 2)
      knight.find_neighbors(nodes, node, 1, 2)
      knight.find_neighbors(nodes, node, 1, -2)
      knight.find_neighbors(nodes, node, -2, -1)
      knight.find_neighbors(nodes, node, -2, 1)
      knight.find_neighbors(nodes, node, 2, 1)
      knight.find_neighbors(nodes, node, 2, -1)
    end


  end
end
