# frozen_string_literal: false

class Node
  attr_accessor :position, :neighbors

  def initialize
    @position = nil
    @neighbors = []
  end
end
