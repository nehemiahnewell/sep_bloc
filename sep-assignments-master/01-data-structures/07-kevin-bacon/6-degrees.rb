class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  
  def initialize(name)
    @name = name
    @film_actor_hash = {}
  end
end


def find_kevin_bacon(actor, visited = [], steps = 0)
  path = []
  found = false
  if actor.name == "Kevin Bacon"
    return path
  end
  if steps == 6
    return false
  end
  steps += 1
  actor.film_actor_hash.each do |movie, costars|
    if visited.include?(movie)
      next
    end
    visited.push(movie)
    costars.each do |cast|
      found = find_kevin_bacon(cast, visited, steps)
      if found
        break
      end
    end
    if found
      path.push(movie)
      path.push(found)
      path.flatten!
      return path
    end
  end
  return false
end


#   # other_actors = start.film_actor_hash
#   # visited.push(start.name)
#   # other_actors.each do |actor|
#   #   unless visited.include?(actor.name)
#   #     up_one = find_kevin_bacon(actor, visited)
#   #     unless up_one == false
#   #       path
#   #     end
#   #   end
#   # end

#   # return path

Kevin_Bacon = Node.new("Kevin Bacon")

fake_actor_1_movie_1 = Node.new("fake_actor_1_movie_1")
fake_actor_1_movie_2 = Node.new("fake_actor_1_movie_2")
fake_actor_1_movie_3 = Node.new("fake_actor_1_movie_3")
fake_actor_1_movie_4 = Node.new("fake_actor_1_movie_4")
fake_actor_1_movie_5 = Node.new("fake_actor_1_movie_5")
fake_actor_1_movie_6 = Node.new("fake_actor_1_movie_6")
fake_actor_1_movie_7 = Node.new("fake_actor_1_movie_7")



Kevin_Bacon.film_actor_hash['footloose'] = [fake_actor_1_movie_1]

fake_actor_1_movie_1.film_actor_hash['fake_movie_1'] = []
fake_actor_1_movie_1.film_actor_hash['fake_movie_2'] = [fake_actor_1_movie_2]
fake_actor_1_movie_1.film_actor_hash['footloose'] = [Kevin_Bacon]

fake_actor_1_movie_2.film_actor_hash['fake_movie_2'] = [fake_actor_1_movie_1]
fake_actor_1_movie_2.film_actor_hash['fake_movie_3'] = [fake_actor_1_movie_3]

fake_actor_1_movie_3.film_actor_hash['fake_movie_3'] = [fake_actor_1_movie_2]
fake_actor_1_movie_3.film_actor_hash['fake_movie_4'] = [fake_actor_1_movie_4]

fake_actor_1_movie_4.film_actor_hash['fake_movie_4'] = [fake_actor_1_movie_3]
fake_actor_1_movie_4.film_actor_hash['fake_movie_5'] = [fake_actor_1_movie_5]

fake_actor_1_movie_5.film_actor_hash['fake_movie_5'] = [fake_actor_1_movie_4]
fake_actor_1_movie_5.film_actor_hash['fake_movie_6'] = [fake_actor_1_movie_6]

fake_actor_1_movie_6.film_actor_hash['fake_movie_6'] = [fake_actor_1_movie_5]
fake_actor_1_movie_6.film_actor_hash['fake_movie_7'] = [fake_actor_1_movie_7]

fake_actor_1_movie_7.film_actor_hash['fake_movie_7'] = [fake_actor_1_movie_6]

print find_kevin_bacon(fake_actor_1_movie_1)
puts
print find_kevin_bacon(fake_actor_1_movie_4)
puts
print find_kevin_bacon(fake_actor_1_movie_6)
puts
print find_kevin_bacon(fake_actor_1_movie_7)