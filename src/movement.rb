class EventedMoveStrategy
  def initialize
    @displacement = Vector.new(1,0)
    @events = []
  end

  def notify(event)
    @events.push(event)
  end
  
  def move(location)
    result = location
    @events.each do |event|
      if (event.type == :rightSignaled)
        result = result.displaceBy(@displacement)
      elsif (event.type == :leftSignaled)
        result = result.displaceBy(@displacement.times(-1))
      end
    end
    result
  end
end

class Linear
  def initialize(displacement)
    @displacement = displacement
  end

  def move(location)
    location.displaceBy(@displacement)
  end
end

class StandStill
  def move(location)
    location
  end
end    
