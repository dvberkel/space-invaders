require 'observer'
require 'events'

class Alien < Observable
  def die()
    notifyAll(DiedEvent.new)
  end
end
