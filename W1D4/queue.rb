class Queue
  attr_reader :queue_arr
  def initialize
    @queue_arr = []
  end

  def enqueue(*els)
    els.each { |el| @queue_arr.push(el) }
  end

  def dequeue
    return "There already nothing in queue!" if @queue_arr.empty?
    @queue_arr.shift
  end

  alias_method :show, :queue_arr
end
