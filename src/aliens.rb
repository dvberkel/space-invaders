require 'observer'
require 'location'
require 'events'


class Alien < Observable
  attr_reader :location, :boundingBox
  def initialize(options = {:location => Location.new(0,0), :boundingBox => BoundingBox.new(4,4)})
    super()
    @location = options[:location]
    @boundingBox = options[:boundingBox]
  end

  def die()
    notifyAll(DiedEvent.new)
  end

  def move
    
  end
end
