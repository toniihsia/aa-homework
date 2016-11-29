require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    @store.length
  end

  def extract
    raise "This heap is empty." if @store.length <= 0

    popped_val = @store[0]
    if count > 1
      @store[0] = @store.pop
      self.class.heapify_down(@store, 0, &prc)
    else
      @store.pop
    end

    popped_val
  end


  def peek
    raise "This heap is empty." if @store.length <= 0
    @store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, self.count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(length, parent_index)
      ughh = []
      left_child_idx = ((2 * parent_index) + 1) unless ((2 * parent_index) + 1) >= length
      right_child_idx = ((2 * parent_index) + 2) unless ((2 * parent_index) + 2) >= length

      ughh << left_child_idx if left_child_idx
      ughh << right_child_idx if right_child_idx

      return ughh
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    left_child_idx, right_child_idx = child_indices(length, parent_idx)

    parent_val = array[parent_idx]

    children = []
    children << array[left_child_idx] if left_child_idx
    children << array[right_child_idx] if right_child_idx

    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end

    swap_idx = nil
    if children.length == 1
      swap_idx = left_child_idx
    else
      swap_idx = prc.call(children[0], children[1]) == -1 ? left_child_idx : right_child_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, length, &prc)
  end

  def self.heapify_up(array, child_idx, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx <= 0

    parent_idx = parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]
    if prc.call(child_val, parent_val) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = parent_val, child_val
      heapify_up(array, parent_idx, length, &prc)
    end
  end
end
