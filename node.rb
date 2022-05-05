# frozen_string_literal: false

class Node
  attr_accessor :position, :neighbors, :distance, :previous

  def initialize(position)
    @position = position
    @neighbors = []
    @distance = nil
    @previous = nil
  end
end
