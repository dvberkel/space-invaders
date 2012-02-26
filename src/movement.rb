module Moveable
  def move
    previousLocation = @location
    @location = @moveStrategy.move(previousLocation)
    if (@location != previousLocation)
      notifyAll(movementEvent())
    end
  end
end

class MovementStrategy
  def notify(event)
    # do nothing
  end
end

class EventedMoveStrategy < MovementStrategy
  def initialize(displacement = Vector.new(1,0))
    @displacement = displacement
    @events = []
  end

  def notify(event)
      @events.push(event)
  end
  
  def move(location)
    result = location
    @events.each do |event|
      result = result.displaceBy(@displacement.times(event.direction))
    end
    @events.clear
    result
  end
end

class Linear < MovementStrategy
  def initialize(displacement)
    @displacement = displacement
  end

  def move(location)
    location.displaceBy(@displacement)
  end
end

class StandStill < MovementStrategy
  def move(location)
    location
  end
end    
