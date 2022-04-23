# frozen_string_literal: false

class Knight

  def find_neighbors(nodes, node, digit1, digit2)

    # readability
    coords = node.position

    # check if a neighbor can exist on the board
    if (coords[0]+digit1 >= 0) &&
    (coords[0]+digit1 <= 7) &&
    (coords[1]+digit2 >= 0) &&
    (coords[1]+digit2 <= 7)
      # if yes, find it in the nodes list
      nodes.each do |neighbor|
        if neighbor.position == [coords[0]+digit1,coords[1]+digit2]
          # add it as a neighbor
          node.neighbors.push({node: neighbor, distance: 1})
        end
      end
    end
  end
end

