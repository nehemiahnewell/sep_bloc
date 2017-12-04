# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    self.members.delete_if { |a| a == person }
  end

  def front
    self.members.first
  end

  def middle
    length = self.members.length
    self.members[((length/2).ceil)]
  end

  def back
    self.members.last
  end

  def search(person)
    self.members.each do |name|
      if name == person
        return name
      end
    end
    nil
  end

  private

  def index(person)
    self.members.index(person)
  end

end