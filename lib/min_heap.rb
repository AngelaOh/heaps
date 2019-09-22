class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn) where n is the number of nodes
  # Space Complexity: O(logn)
  def add(key, value = key)
    new_heap_node = HeapNode.new(key, value)
    @store.push(new_heap_node)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn) where n is the number of nodes
  # Space Complexity: O(logn)
  def remove()
    return nil if @store.empty?
    return @store[0].value if @store.length == 1

    swap(0, @store.length - 1)
    result = @store.pop
    heap_down(0) unless @store.empty?
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return false if @store.length != 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = (index - 1) / 2
    if @store[parent_index].key > @store[index].key && index != 0
      swap(parent_index, index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = index * 2 + 1
    right_child =  index * 2 + 2
    smaller_child = 0
    return if @store[left_child].nil? && @store[right_child].nil?

    if @store[right_child].nil?
      smaller_child = left_child
    else
      if @store[left_child].key < @store[right_child].key
        smaller_child = left_child
      else
        smaller_child = right_child
      end
    end

    if @store[index].key > @store[smaller_child].key
      swap(smaller_child, index)
      heap_down(smaller_child)
    end
    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end