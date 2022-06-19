# frozen_string_literal: false

class Prompt

  def initialize
    @ranks = %w[ a b c d e f g h]
    @files = [1, 2, 3, 4, 5, 6, 7, 8]
  end

  def get_source
    print "Please choose a starting position.\nExample: a1\n"
    input = gets.chomp

    # translate 'a1' to [0, 0]
    source = []
    source.push(@ranks.find_index(input[0]))
    source.push(@files.find_index(input[1].to_i))

    source
  end

  def get_target
    print "Please choose an ending position.\nExample: h8\n"
    input = gets.chomp

    # translate 'a1' to [0, 0]
    target = []
    target.push(@ranks.find_index(input[0]))
    target.push(@files.find_index(input[1].to_i))

    target
  end

end
