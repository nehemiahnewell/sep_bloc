require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating == root.rating
      return "error"
    end
    if node.rating > root.rating
      if root.right.nil?
        root.right = node
        root.right.parent = root
        # puts ("inserting: " + node.title)
      else
        insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
        root.left.parent = root
        # puts ("inserting: " + node.title)
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return_value = nil
    if root.title == data
      return root
    elsif !root.left.nil?
      return_value = find(root.left, data)
    end
    if return_value.nil? && !root.right.nil?
      return_value = find(root.right, data)
    end
    return return_value
  end

  def delete(root, data)
    deleted_node = self.find(root, data)
    if deleted_node == nil
      return nil
    end
    orphaned_nodes = adoption_listing(deleted_node, [])
    if deleted_node.parent.left == deleted_node
      deleted_node.parent.left = nil
    else
      deleted_node.parent.right = nil
    end
    orphaned_nodes.shift()
    orphaned_nodes.each {|orphan| self.insert(deleted_node[1], orphan) }
  end

  #Gets orphaned nodes
  def adoption_listing(root, orphaned_nodes)
    if root.nil?
      return
    end
    left_path = root.left
    right_path = root.right
    root.left = nil
    root.right = nil
    orphaned_nodes.push(root)
    if !left_path.nil? then orphaned_nodes = adoption_listing(left_path, orphaned_nodes) end
    if !right_path.nil? then orphaned_nodes = adoption_listing(right_path, orphaned_nodes) end
    return orphaned_nodes
  end
  
  
  #start the print
  def printf()
    breadth_first(@root)
  end

  def breadth_first(node)
    nodes = [node]
    output = []
    until nodes.empty?
      output.push(nodes[0].title + ": " + nodes[0].rating.to_s)
      unless nodes[0].left == nil
        nodes.push(nodes[0].left)
      end
      unless nodes[0].right == nil
        nodes.push(nodes[0].right)
      end
      nodes.shift()
    end
    puts output
  end
end
