require 'space-invaders'
require 'aliens'
require 'location'

class Game < SpaceInvaders
  def start
    addAlien(Alien.new({:location => Vector.new(0,500)}))
    gun = Gun.new
    addGun(gun)
    gun.fire
  end

  def tick
    move
  end
end
