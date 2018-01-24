require_relative 'node'

class OpenAddressing
  attr_accessor :items
  attr_accessor :size
  
  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    next_place = nil;
    # Get the location inside the array.
    entry_check = @items[index(key, @size)]
    if entry_check.nil?
      @items[index(key, @size)] = Node.new(key, value)
    elsif
      next_place = next_open_index(index(key, @size))
      if next_place == -1
        resize
        self[key] = value
      elsif
        @items[next_place] = Node.new(key, value)
      end
    end
    print("the size is ")
    puts(@size)
    print @items
    puts " in the hash"
  end

  def [](key)
    item = nil
    starting_place = index(key, @size)
    for i in starting_place..(@size + starting_place) do
      place = i % size
      if items[place].nil?
        break
      elsif items[place].key == key
        item = items[place].value
        break
      end
    end
    return item
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    arr = key.split(//)
    arr.each.with_index { |value, index| sum+=(value.ord - index) }
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    pointing = -1
    starting_place = index
    for i in starting_place..(@size + starting_place) do
      place = i % size
      if items[place].nil?
        pointing = place
        break
      end
    end
    return pointing
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    old_list = @items
    @size = @size * 2
    @items = Array.new(size)
    old_list.each { |item| if !item.nil? then self[item.key] = item.value end }
  end
end