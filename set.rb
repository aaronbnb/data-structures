class MaxIntSet
  def initialize(max)
    @store = Array.new max, false
  end

  def insert(num)
    validate!(num)
    #if the num is already in the set, we should return something that sorta tells the user
    # like false
    return false if include?(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless include?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    return nil unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each { |el| return true if el == num }
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end
