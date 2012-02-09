require 'observer'
require 'location'
require 'events'


class Alien < Observable
  attr_reader :location, :boundingBox
  def initialize(options = {})
    super()
    options = {
      :location => Location.new(0,0), :boundingBox => BoundingBox.new(4,4), :moveStrategy => StandStill.new()}.merge(options)
    @location = options[:location]
    @boundingBox = options[:boundingBox]
    @moveStrategy = options[:moveStrategy]
  end

  def die()
    notifyAll(AlienDied.new(self))
  end

  def move
    @location = @moveStrategy.move(@location)
  end
end
