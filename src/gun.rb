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
    @location = @moveStrategy.move(@location)
  end
end
