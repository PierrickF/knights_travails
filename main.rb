# frozen_string_literal: false

require_relative 'board'
require_relative 'graph'

board = Board.new
graph = Graph.new(board.struct)
graph.nodes.each do |node|
  print node.neighbors
  print "\n"
end

