class Map
  attr_accessor :map_arr
  def initialize
    @map_arr = []
  end

  def assign(key, value)
    @map_arr.each do |kv_pair|
      orig_key = kv_pair[0]
      orig_value = kv_pair[1]

      (orig_key == key) ? orig_value = value : @map_arr << [key, value]
    end
  end

  def lookup(target_key)
    @map_arr.each do |kv_pair|
      key = kv_pair[0]
      value = kv_pair[1]

      (key == target_key) ? return value : puts "That key doesn't exist."
    end
  end

  def remove(target_key)
    @map_arr.each_with_index do |kv_pair, i|
      key = kv_pair[0]

      (key == target_key) ? @map_arr.delete_at(i) : puts "That key doesn't exist"
    end
  end

  def show
    @map_arr
  end
end
