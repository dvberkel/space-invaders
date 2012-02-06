require 'observer'
require 'location'
require 'events'


class Alien < Observable
  def initialize(location = Location.new(0,0), boundingBox = BoundingBox.new(4,4))
    super()
    @location = location
    @boundingBox = boundingBox
  end

  def die()
    notifyAll(DiedEvent.new)
  end

  def location
    return @location
  end

  def boundingBox
    return @boundingBox
  end
end
