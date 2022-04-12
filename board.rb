# frozen_string_literal: false

class Board
  attr_accessor :struct

  def initialize
    @struct = Array.new(8) { Array.new(8) { 'o' } }
  end

  def show
    @struct.each do |row|
      row.each do |slot|
        print " #{slot} ".black.on_white
      end
      puts "\n"
    end
  end
end
