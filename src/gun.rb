require 'observer'
require 'events'

class Gun < Observable
  def fire
    notifyAll(BulletFired.new)
  end
end
