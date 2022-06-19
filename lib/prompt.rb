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

  def print_results(path, visual_board)
    # translate [0, 0] to 'a1'
    str_array = []
    path.each do |int_coord|
      temp_str = ''
      temp_str << @ranks[int_coord[0]]
      temp_str << @files[int_coord[1]].to_s
      str_array.push(temp_str)
    end

    visual_board.show

    print "\n"

    print "The shortest path between #{str_array[0]}"\
    " and #{str_array[-1]} is:\n"

    output = ''
    str_array.each_with_index do |item, index|
      next_item = str_array[index+1]
      output << item
      output << ' -> ' unless next_item.nil?
    end

    print "#{output}\n"

  end
end
