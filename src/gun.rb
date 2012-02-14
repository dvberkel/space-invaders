require 'observer'
require 'events'
require 'location'
require 'movement'

class Gun < Observable
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

  def move
    previousLocation = @location
    @location = @moveStrategy.move(previousLocation)
    if (@location != previousLocation)
      notifyAll(GunMoved.new)
    end
  end
end
