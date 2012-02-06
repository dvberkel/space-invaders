require 'events'

class Alien
  def initialize
    @observers = []
  end
  
  def die()
    @observers.each do |observer|
      observer.notify(DiedEvent.new)
    end
  end

  def addObserver(observer)
    @observers.push(observer)
  end
end
