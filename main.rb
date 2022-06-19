# frozen_string_literal: false

require 'colorize'

require_relative 'lib/board'
require_relative 'lib/graph'
require_relative 'lib/dijkstra'
require_relative 'lib/visual_board'
require_relative 'lib/visual_board_square'
require_relative 'lib/prompt'

board = Board.new
visual_board = VisualBoard.new
prompt = Prompt.new

visual_board.show

graph = Graph.new(board.struct)
source = prompt.get_source
target = prompt.get_target

dijkstra = Dijkstra.new(graph, source, target)
shortest_path = dijkstra.shortest_path

prompt.print_results(shortest_path, visual_board)
