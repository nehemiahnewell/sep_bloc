require_relative 'node'

class SixDegreesOfKevinBacon
  def path(actor)
    actors = [actor]
    route = {}
    for i in 0..6 do
      current_actor = actors.pop()
      current_actor.film_actor_hash.each do |movie|
        if !route.has_key?(movie)
          movie.each do [cast]
            route[movie]
          end
        end
      end
    end
  end
end