require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :items
  attr_accessor :size
  attr_accessor :number_of_items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size) {LinkedList.new}
    @size = size
    @number_of_items = 0.0
  end

  def []=(key, value)
    @number_of_items = @number_of_items + 1
    if( load_factor() > @max_load_factor )
      resize
    end
    place = @items[index(key, @size)]
    place.add_to_tail(Node.new(key, value))
  end

  def [](key)
    place = @items[index(key, @size)]
    returnedlist = place.deconstruct()
    handback = nil
    returnedlist.each {|x| if x.key == key then handback = x.value end }
    return handback
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

  # Calculate the current load factor
  def load_factor
    @number_of_items/@size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    temp_holding = []
    @items.each {|x| temp_holding.concat(x.deconstruct) }
    # temp_holding.each do |resub|
    #   puts(resub.key + " " + resub.value)
    # end
    @size = @size * 2
    @items = Array.new(size, LinkedList.new)
    temp_holding.each do |resub|
      place = @items[index(resub.key, @size)]
      place.add_to_tail(resub)
    end
    # puts "done"
  end
end
