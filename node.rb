# frozen_string_literal: false

class Node
  attr_accessor :position, :left_child, :right_child

  def initialize(position)
    @position = position
    @left_child = nil
    @right_child = nil
  end
end
