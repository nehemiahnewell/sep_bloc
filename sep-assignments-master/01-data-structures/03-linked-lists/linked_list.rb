require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if(self.tail == nil)
      self.tail = node
    else
      old_tail = self.tail
      self.tail = node
      old_tail.next = self.tail
    end
    if(self.head == nil)
      self.head = self.tail
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = self.head
    next_node = self.head.next
    if(next_node == nil)
      self.head = nil
      self.tail = nil
      return
    end
    while(next_node != nil)
      if(next_node.next == nil)
        current_node.next = nil
        self.tail = current_node
        return
      else
        current_node = next_node
        next_node = current_node.next
      end
    end
  end

  # This method prints out a representation of the list.
  def print ()
    current_node = self.head
    while(current_node != nil)
      puts (current_node.data)
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = self.head
    next_node = self.head.next
    if(current_node == node)
      if(next_node == nil)
        return
      end
      self.head = next_node
      return
    end
    while(next_node != nil)
      if(next_node == node)
        if(next_node == self.tail)
          current_node.next = nil
          self.tail = current_node
        else
          current_node.next = next_node.next
        end
        return
      else
        current_node = next_node
        next_node = current_node.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if(self.head == nil)
      self.head = node
    else
      old_head = self.head
      self.head = node
      self.head.next = old_head
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    old_head = self.head
    self.head = self.head.next
    return old_head
  end
end