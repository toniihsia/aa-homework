require 'byebug'
class LRUCache
  attr_reader :cache

  def initialize(cache_limit)
    @cache = []
    @cache_limit = cache_limit
  end

  def count
    @cache.count
    # returns number of elements currently in cache
  end

  def add(el)
    # debugger
    if count < @cache_limit
      @cache.push(el)
    elsif @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else count == @cache_limit
      @cache.shift
      @cache.push(el)
    end
  end

  def show
    p @cache
    # shows the items in the cache, with the LRU item first
  end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show

p johnny_cache.cache == [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {a: 1, b: 2, c: 3}]
# in O(n) time

# cache = []
# cache = "I walk the line", 5, [1, 2, 3], 5
# cache = 5, [1, 2, 3], 5, -5
# cache = [1, 2, 3], 5, -5, {a: 1, b: 2, c: 3}
# cache = 5, -5, {a: 1, b: 2, c: 3}, [1, 2, 3, 4]
# cache = -5, {a: 1, b: 2, c: 3}, [1, 2, 3, 4], "I walk the line"
# cache = {a: 1, b: 2, c: 3}, [1, 2, 3, 4], "I walk the line", :ring_of_fire
# cache = {a: 1, b: 2, c: 3}, [1, 2, 3, 4], :ring_of_fire, "I walk the line"
# cache = [1, 2, 3, 4], :ring_of_fire, "I walk the line", {a: 1, b: 2, c: 3}

# We will assume our input is limited to Fixnums, Strings, Arrays, Symbols, and Hashes.
# We will allow the user to set the size of the cache.
