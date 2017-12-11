class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(@stack.size, item)
    self.top = @stack[@stack.size - 1]
  end

  def pop
    @stack.delete_at(@stack.size - 1)
    returnvalue = self.top
    self.top = @stack[@stack.size - 1]
    return returnvalue
  end

  def empty?
    if(@stack.size > 0)
      return false
    else
      return true
    end
  end
end