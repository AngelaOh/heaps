require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn) because of the add and removing from the heap algorithm
# Space Complexity: O(n) because the size of the heap depends on the input size of the list
def heap_sort(list)
  size = list.length 
  return list if size == 0 || size == 1

  heap = MinHeap.new
  i = 0
  while i < size 
    heap.add(list[i])
    i += 1
  end

  i = 0
  while i < size
    result = heap.remove
    list[i] = result
    i += 1
  end
  return list

end

