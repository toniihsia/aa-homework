require 'byebug'

class Map
  attr_accessor :map_arr
  def initialize
    @map_arr = []
  end

  def assign(key, value)
    @map_arr << [key, value] if @map_arr.empty?

    @map_arr.each do |kv_pair|
      (kv_pair[0] == key) ? kv_pair[1] = value : @map_arr << [key, value]
    end
  end

  def lookup(target_key)
    @map_arr.each do |kv_pair|
      key = kv_pair[0]
      value = kv_pair[1]

      (key == target_key) ? (return value) : (return "That key doesn't exist.")
    end
  end

  def remove(target_key)
    @map_arr.each_with_index do |kv_pair, i|
      key = kv_pair[0]

      (key == target_key) ? @map_arr.delete_at(i) : (return "That key doesn't exist")
    end
  end

  alias_method :show, :map_arr
end
