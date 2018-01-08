class HashClass
  require_relative 'hash_item'
  
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    # Get the location inside the array.
    entry_check = @items[index(key, @size)]
    if entry_check.nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif entry_check.key != key
      resize
      self[key] = value
    elsif entry_check.key == key && entry_check.value != value
      resize
      entry_check.value = value
    end
  end


  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  def resize
    @size = @size * 2
    resized_array = Array.new(@size)
    @items.each { |item| if item != nil then resized_array[index(item.key, @size)] = item end}
    @items = resized_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    # Uses the sum method on the key, as a string can be treated as an an array of chars. 
     sum = 0
     arr = key.split(//)
     arr.each.with_index { |value, index| sum+=(value.ord - index) }
     sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end