# frozen_string_literal: false

class Node
  attr_accessor :position, :neighbors

  def initialize(position)
    @position = position
    @neighbors = []
  end
end
