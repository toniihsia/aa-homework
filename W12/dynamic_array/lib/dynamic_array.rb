require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    self.store[index] = value
  end

  # O(1)
  def pop
    popped_val = self[self.length - 1]
    self[self.length - 1] = nil
    self.length -= 1

    popped_val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if self.length == self.capacity

    self.length += 1
    self[length - 1] = val

    nil
  end

  # O(n): has to shift over all the elements.
  def shift
    shifted_val = self[0]
    (1...self.length).each { |i| self[i - 1] = self[i] }
    self.length -= 1

    shifted_val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if self.length == self.capacity


    self.length += 1
    (self.length - 2).downto(0) { |i| self[i + 1] = self[i]}
    self[0] = val

    nil
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    if index >= self.length || index < 0 || self.length == 0
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = self.capacity * 2
    new_store = StaticArray.new(new_capacity)
    (0...self.length).each { |i| new_store[i] = self[i] }

    self.capacity = new_capacity
    self.store = new_store
  end
end
