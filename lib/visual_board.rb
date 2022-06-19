# frozen_string_literal: false

class VisualBoard
  attr_reader :struct

  def initialize
    @ranks = %w[a b c d e f g h]
    @files = [1, 2, 3, 4, 5, 6, 7, 8]
    @struct = Array.new(8) { Array.new(8) { VisualBoardSquare.new } }
    identify_square_color
    add_legend
  end

  def show
    @struct.each do |row|
      row.each do |square|
        if defined?(square.piece)
          case square.color
          when 'white'
            print "#{square.piece} ".colorize(:background => :white)
          when 'black'
            print "#{square.piece} ".colorize(:background => :black)
          end
        else
          print "#{square} "
        end
      end
      print "\n"
    end
  end

  private

  def identify_square_color
    @struct.each do |row|
      row.each do |square|
        if @struct.index(row).even?
          case row.index(square).even?
          when true
            square.color = 'white'
          when false
            square.color = 'black'
          end
        else
          case row.index(square).even?
          when false
            square.color = 'white'
          when true
            square.color = 'black'
          end
        end
      end
    end
  end

  def add_legend
    counter = 8
    @struct.each { |row| row.push(@files[counter -= 1]) }
    @struct.push(@ranks)
  end
end
