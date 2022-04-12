# frozen_string_literal: false

require_relative 'node'

# define a BST
class Tree
  attr_accessor :root, :data

  def initialize(array)
    # clean input data
    @data = array.uniq.sort
    @root = build_tree(array)
  end

  def build_tree(array)
    # stop recursion if there are no more data to process
    return nil if array.empty?

    # find the middle point in the array
    mid = (array.size - 1) / 2
    # create a new node at the middle point of the array
    root = Node.new(array[mid])

    # set the middle point as the root of the tree branch
    # point the root to the left branch and repeat
    root.left_child = build_tree(array[0...mid])
    # point the root to the right branch and repeat
    root.right_child = build_tree(array[(mid + 1)..-1])

    root
  end

  def find(value, node = @root)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # stop recursion if the value has been found
    return node if node.value == value

    # keep looking and go either left or right depending on the value
    if value < node.value
      find(value, node.left_child)
    elsif value > node.value
      find(value, node.right_child)
    end
  end

  def insert(value, node = @root)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # go either left or right depending on the value
    if value < node.value
      insert(value, node.left_child)
      # insertion is always at the leaf
      node.left_child = Node.new(value) if node.left_child.nil?
    else
      insert(value, node.right_child)
      # insertion is always at the leaf
      node.right_child = Node.new(value) if node.right_child.nil?
    end
  end

  # support method for the delete method
  def leftmost_leaf(node)
    node = node.left_child until node.left_child.nil?
    node
  end

  def delete(value, node = @root)
    # deletion: ultimately this method returns nil
    return node if node.nil?

    # recursion: lower values are on the left
    if value < node.value
      # recursion: keep navigating to the left branch
      # deletion (0 child): ultimately nil is assigned to left_child
      # replacement (1 child): ultimately left_child = left_child.left_child
      node.left_child = delete(value, node.left_child)
    # recursion: greater values are on the right
    elsif value > node.value
      # recursion: keep navigating to the right branch
      # deletion (0 child): ultimately nil is assigned to right_child
      # replacement (1 child): ultimately right_child = right_child.right_child
      node.right_child = delete(value, node.right_child)
    # recursion: the node to be deleted has been found
    else
      # if the node has 0 child, returns nil
      # if the node has 1 child, returns its replacement
      return node.right_child if node.left_child.nil?
      return node.left_child if node.right_child.nil?

      # if the node has 2 children
      # find the leaf at the bottom left of its right_child
      leftmost_node = leftmost_leaf(node.right_child)
      # copy the value from the leftmost_leaf to the current position
      node.value = leftmost_node.value
      # delete the leftmost_leaf from its former position
      node.right_child = delete(leftmost_node.value, node.right_child)
    end
    # recursion: keep navigating the tree
    # deletion: ultimately this method returns nil or its replacement
    node
  end

  # level by level
  def level_order(queue = Queue.new, node = @root)
    # print the current element in queue
   puts node.value

    # add the left child, then the right child, to the queue
    # but don't do it if it doesn't exist
    queue << node.left_child unless node.left_child.nil?
    queue << node.right_child unless node.right_child.nil?

    # guard clause once the queue is empty
    return if queue.empty?

    # rinse and repeat from the next element in queue
    level_order(queue, queue.pop)
  end

  # left, root, right
  def inorder(node = @root)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # keep going to the left
    inorder(node.left_child)
    # print the current element
    puts node.value
    # keep going to the right
    inorder(node.right_child)
  end

  # root, left, right
  def preorder(node = @root)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # print the current element
    puts node.value
    # keep going to the left
    preorder(node.left_child)
    # keep going to the right
    preorder(node.right_child)
  end

  # left, right, root
  def postorder(node = @root)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # keep going to the left
    postorder(node.left_child)
    # keep going to the right
    postorder(node.right_child)
    # print the current elelment
    puts node.value
  end

  # longest distance between a node and a leaf (in its children)
  def height(node = @root)
    # because the height of a leaf node should be 0
    # return -1 once we are past a leaf node
    # to counter the +1 in our calculations below
    return -1 if node.nil?

    # compute the height of the left child
    left_height = height(node.left_child)
    # compute the height of the right child
    right_height = height(node.right_child)
    # the height of the current node is
    # the height of either its left or right child (whichever is the largest)
    # plus one to accoutn for the edge between the node and its child
    return [left_height, right_height].max + 1
  end

  # distance between a target node and the root of the tree
  # this is an inorder recursion, with a counter at each recursion
  def depth(dist = 0, node = @root, target)
    # stop recursion if there are no more data to process
    return nil if node.nil?

    # keep going to the left
    depth(dist, node.left_child, target)
    # print the current element
    if node.value == target
      return dist
    else
      dist += 1
    end
    # keep going to the right
    depth(dist, node.right_child, target)
  end

  # the difference of height between each left and right subtree
  # must not be > 1
  def balanced?(node = @root)
    # stop recursion of there are no more data to process
    return true if node.nil?

    left_height = height(node.left_child)
    right_height = height(node.right_child)
    return false if (left_height - right_height).abs > 1
    balanced?(node.left_child)
    balanced?(node.right_child)
  end

  def rebalance(node = @root, array = [])
    # return an array full of values once the whole tree has been parsed
    return Tree.new(array) if node.nil?

    rebalance(node.left_child, array)
    array.push(node.value)
    rebalance(node.right_child, array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
