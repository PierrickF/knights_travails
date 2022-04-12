# frozen_string_literal: false

class Node
  attr_accessor :position, :vertices

  def initialize(position)
    @position = position
    @vertices = []
  end
end
