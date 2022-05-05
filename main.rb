# frozen_string_literal: false

require_relative 'board'
require_relative 'graph'
require_relative 'dijkstra'

board = Board.new
graph = Graph.new(board.struct)

source = [0, 0]
target = [7, 7]

algo = Dijkstra.new(graph, source, target)
