# frozen_string_literal: false

require_relative 'board'
require_relative 'graph'

board = Board.new
graph = Graph.new(board.struct)
graph.nodes.each do |node|
  print "#{node.position}'s neighbors are:\n"
  node.neighbors.each do |hash|
    print hash[:node].position
  end
  print "\n\n"
end

