require 'observer'
require 'events'
require 'location'
require 'movement'
require 'entity'

class Gun < Entity
  include Moveable
  attr_reader :location
  def initialize(options = {})
    super()
    options = {
      :location => Vector.new(0,0),
      :moveStrategy => StandStill.new
    }.merge(options)
    @location = options[:location]
    @moveStrategy = options[:moveStrategy]
  end

  def notify(event)
    if (event.type == :fireSignaled)
      fire
    else
      @moveStrategy.notify(event)
    end
  end

  def fire
    notifyAll(GunFired.new(Bullet.new({:location => @location})))
  end

  def movementEvent()
    GunMoved.new(self)
  end
end
