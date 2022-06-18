# frozen_string_literal: false

class VisualBoardSquare
  attr_accessor :color, :coord, :piece

  def initialize
    @color = nil
    @coord = nil
    @piece = ' '
  end
end
