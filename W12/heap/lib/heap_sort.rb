require_relative "heap"

class Array
  def heap_sort!
    (2..self.length).each do |heap_size|
      BinaryMinHeap.heapify_up(self, heap_size - 1, heap_size)
    end

    self.length.downto(2).each do |heap_size|
      self[heap_size - 1], self[0] = self[0], self[heap_size - 1]
      BinaryMinHeap.heapify_down(self, 0, heap_size - 1)
    end

    self.reverse!
  end
end
