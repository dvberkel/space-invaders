require 'space-invaders'
require 'aliens'
require 'location'

class Game < SpaceInvaders
  def start
    addAlien(Alien.new({:location => Vector.new(0,500)}))
    @gun = Gun.new({:moveStrategy => EventedMoveStrategy.new})
    addGun(@gun)
  end

  def tick
    move
    collisionDetection
  end

  def signal(signal)
    @gun.notify(signal)
  end
end
