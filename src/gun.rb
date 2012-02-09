require 'observer'
require 'events'
require 'location'
require 'movement'

class Gun < Observable
  attr_reader :location
  def initialize(options = {})
    super()
    options = {
      :location => Location.new(0,0),
      :moveStrategy => StandStill.new
    }.merge(options)
    @location = options[:location]
    @moveStrategy = options[:moveStrategy]
  end

  def fire
    notifyAll(BulletFired.new)
  end

  def move
    previousLocation = @location
    @location = @moveStrategy.move(previousLocation)
    if (@location != previousLocation)
      notifyAll(GunMoved.new)
    end
  end
end
