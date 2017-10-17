class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  #a = LinkedList.new a[1]
  def [](i)
    traverse_node = @head.next
    j = 0
    while traverse_node
      return traverse_node if i == j
      j += 1
      traverse_node = traverse_node.next
    end
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    traverse_node = @head
    while traverse_node
      return traverse_node.val if traverse_node.key == key
      traverse_node = traverse_node.next
    end
  end

  def include?(key)
    traverse_node = @head
    while traverse_node
      return true if traverse_node.key == key
      traverse_node = traverse_node.next
    end
    false
  end

  def append(key, val)
    insert_node = Node.new(key, val)
    insert_node.next = @tail
    insert_node.prev = @tail.prev

    @tail.prev.next = insert_node
    @tail.prev = insert_node
  end

  def update(key, val)
    return false unless include?(key)
    traverse_node = @head
    while traverse_node
      if traverse_node.key == key
        traverse_node.val = val
      end
      traverse_node = traverse_node.next
    end
  end

  def remove(key)
    return false unless include?(key)
    traverse_node = @head
    while traverse_node
      if traverse_node.key == key
        traverse_node.prev.next = traverse_node.next
        traverse_node.next.prev = traverse_node.prev
        traverse_node.val = nil
      end
      traverse_node = traverse_node.next
    end
  end

  def each
    current_node = @head.next
     until current_node == @tail
       yield current_node
       current_node = current_node.next
     end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
