# frozen_string_literal: false

class Board
  attr_accessor :struct

  def initialize
    @struct = Array.new(8) { Array.new(8) { 'o' } }
  end
end
