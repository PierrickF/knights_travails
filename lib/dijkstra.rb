# frozen_string_literal: false

class Dijkstra

  def initialize(graph, start, target)
    @graph = graph
    @start = start
    @target = target

    graph.nodes.each do |node|
      if node.position == start
        # set the distance of the source to 0
        node.distance = 0
        print "#{node.position}'s distance was set to 0.\n"
      else
        # set all the other distances to infinity
        node.distance = 1.0/0
      end
    end

    print "All the other distances were set to #{1.0/0}.\n\n"

    q_graph = graph
    print "Graph copied.\n\n"

    q_graph.nodes.each do |node|
      if node.position == target
        @target_node = node
      end
    end

    while q_graph.nodes.size > 0
      u = find_min(q_graph)
      print "#{u.position} has the smallest distance in the graph.\n"
      q_graph.nodes.delete(u)
      print "#{u.position} has been removed from the graph.\n\n"
      u.neighbors.each { |v| relaxation(u, v) if q_graph.nodes.include?(v[0]) }
    end

    path = []
    u = @target_node
    if u.previous || u.position == start
      while u
        path.unshift(u)
        u = u.previous
      end
    end

    print "Shortest path including source and target:\n"
    path.each do |node|
      print "#{node.position}\n"
    end
    print "\n"
  end

  # Since a neighbor is stored as [node, distance_to_parent]
  # v[0] refers to the actual node
  # and v[1] refers to its distance to its parent
  def relaxation(u, v)
    print "Relaxing #{u.position} and #{v[0].position}\n\n"
     if (u.distance + v[1]) < v[0].distance
      v[0].distance = u.distance + v[1]
      v[0].previous = u
    end
  end

  def find_min(q_graph)
    min = 1.0/0
    smallest = nil
    q_graph.nodes.each do |node|
      if node.distance < min
        min = node.distance
        smallest = node
      end
    end
    smallest
  end

end
