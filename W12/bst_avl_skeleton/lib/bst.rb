class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    unless @root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value < node.value
      BinarySearchTree.find!(node.left, value)
    else value > node.value
      BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] unless node

    node_arr = [node.value]
    node_arr += BinarySearchTree.preorder!(node.left) if node.left
    node_arr += BinarySearchTree.preorder!(node.right) if node.right

    node_arr
  end

  def self.inorder!(node)
    return [] unless node

    node_arr = []
    node_arr += BinarySearchTree.inorder!(node.left) if node.left
    node_arr << node.value
    node_arr += BinarySearchTree.inorder!(node.right) if node.right

    node_arr
  end

  def self.postorder!(node)
    return [] unless node

    node_arr = []
    node_arr += BinarySearchTree.postorder!(node.left) if node.left
    node_arr += BinarySearchTree.postorder!(node.right) if node.right
    node_arr << node.value

    node_arr
  end

  def self.height!(node)
    return -1 unless node
    return 0 if node.left.nil? && node.right.nil?

    left_height = 1 + BinarySearchTree.height!(node.left)
    right_height = 1 + BinarySearchTree.height!(node.right)


    left_height > right_height ? (return left_height) : (return right_height)
  end

  def self.max(node)
    return nil unless node
    # if the node doesn't exist, then return nil
    return node unless node.right
    # if the node has no right child, then it is the largest value
    BinarySearchTree.max(node.right)


  end

  def self.min(node)
    return nil unless node
    # if the node doesn't exist, then return nil
    return node unless node.left
    # if the node has no left child, then it is the smallest value

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      temp = node
      node = temp.right.min
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    end
  end
end
