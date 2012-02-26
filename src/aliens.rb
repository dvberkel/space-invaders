require 'observer'
require 'location'
require 'events'
require 'collision-detector'
require 'movement'
require 'entity'

class Alien < Entity
  include Moveable
  attr_reader :location, :boundingBox
  def initialize(options = {})
    super()
    options = {
      :location => Vector.new(0,0), :boundingBox => BoundingBox.new(4,4), :moveStrategy => StandStill.new()}.merge(options)
    @location = options[:location]
    @boundingBox = options[:boundingBox]
    @moveStrategy = options[:moveStrategy]
  end

  def die()
    notifyAll(AlienDied.new(self))
  end

  def movementEvent()
    AlienMoved.new(self)
  end
end
