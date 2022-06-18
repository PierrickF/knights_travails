# frozen_string_literal: false

require 'colorize'

require_relative 'lib/board'
require_relative 'lib/graph'
require_relative 'lib/dijkstra'
require_relative 'lib/visual_board'
require_relative 'lib/visual_board_square'


board = Board.new
graph = Graph.new(board.struct)

source = [0, 0]
target = [7, 7]

algo = Dijkstra.new(graph, source, target)

visual = VisualBoard.new
visual.show
