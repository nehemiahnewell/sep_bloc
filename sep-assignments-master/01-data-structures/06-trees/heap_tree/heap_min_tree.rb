require_relative 'node'

class HeapMinTree
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def insert(node)
    displaced_node = nil
    if @root.nil?
      @root = node
      @root.parent = nil
      # puts("adding a root")
      return
    end
    if node.rating < @root.rating
      displaced_node = @root
      @root = node
      @root.parent = nil
      insert(displaced_node)
      # puts("replacing a root")
      return
    end
    if node.rating == @root.rating
      return "error"
    end
    insert_into_tree(@root, node)
  end

  def insert_into_tree(root, node)
    nodes = [root]
    displaced_node = nil
    until nodes.empty?
      if nodes[0].left == nil
        nodes[0].left = node
        nodes[0].left.parent = nodes[0]
        # puts("adding to left")
      return
      elsif nodes[0].right == nil
        nodes[0].right = node
        nodes[0].right.parent = nodes[0]
        # puts("adding to right")
        return
      elsif nodes[0].left.rating > node.rating
        displaced_node = adoption_listing(nodes[0].left, [])
        nodes[0].left = node
        nodes[0].left.parent = nodes[0]
        displaced_node.each {|orphan| self.insert(orphan) }
        # puts("replacing a left")
        return
      elsif nodes[0].right.rating > node.rating
        displaced_node = adoption_listing(nodes[0].right, [])
        nodes[0].right = node
        nodes[0].right.parent = nodes[0]
        displaced_node.each {|orphan| self.insert(orphan) }
        # puts("replacing a right")
        return
      end
      nodes.push(nodes[0].left)
      nodes.push(nodes[0].right)
      nodes.shift()
      # puts("iterating down")
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
    orphaned_nodes.each {|orphan| self.insert(orphan) }
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
