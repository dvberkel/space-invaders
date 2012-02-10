class EventedMoveStrategy
  def notify(event)
    @event = event
  end
  
  def move(location)
    if (@event.type == :rightSignaled)
      Vector.new(1,0)
    elsif (@event.type == :leftSignaled)
      Vector.new(-1,0)
    end
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
