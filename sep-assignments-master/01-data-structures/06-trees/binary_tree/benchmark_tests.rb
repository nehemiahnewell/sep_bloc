require 'benchmark'
require_relative 'binary_search_tree'
require_relative '../heap_tree/heap_min_tree'



first = Node.new("", 0)
btree = BinarySearchTree.new(first) 
htree = HeapMinTree.new()
Benchmark.bm do |bm|
  bm.report("Binary Inserction to ten thousend nodes") do
    for i in 1..1000
        btree.insert(first, Node.new(i.to_s, i))
    end
  end
  bm.report("Heap Inserction to ten thousend nodes") do
    for i in 1..1000
        htree.insert(Node.new(i.to_s, i))
    end
  end
  bm.report("Binary inserction for 10001") do
    btree.insert(first, Node.new("10001", 10001))
  end
  bm.report("Heap inserction for 10001") do
    htree.insert(Node.new("10001", 10001))
  end
  bm.report("Binary search for 500") do
    btree.find(first, "500")
  end
  bm.report("Heap search for 500") do
    htree.find(htree.root, "500")
  end
  bm.report("Binary deletion for 10001") do
    btree.delete(first, "10001")
  end
  bm.report("Heap deletion for 10001") do
    htree.delete(htree.root, "10001")
  end
end
