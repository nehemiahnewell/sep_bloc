class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.insert(@queue.size, element)
    @tail = @queue[@queue.size - 1]
    if(@head == nil)
      @head = @tail
    end
  end

  def dequeue
    returnvalue = @head
    @head = @queue.fetch(1, nil)
    @queue.delete_at(0)
    @queue.compact!
    return returnvalue
  end

  def empty?
    if(@queue.size > 0)
      return false
    else
      return true
    end
  end
end