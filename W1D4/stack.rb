class Stack
  attr_reader :stack_arr

  def initialize
    @stack_arr = []
  end

  def add(*els)
    els.each { |el| @stack_arr.push(el) }
  end

  def remove
    puts "The stack is already empty!" if @stack_arr.empty?
    @stack_arr.pop
  end

  alias_method :show, :stack_arr
end
