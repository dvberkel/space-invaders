require 'space-invaders'
require 'aliens'
require 'location'

class Game < SpaceInvaders
  def start
    (-4..4).each do |ix|
      (0..2).each do |iy|
        x,y = 80 * ix, 500 - 50 * iy
        addAlien(Alien.new({:location => Vector.new(x,y)}))
      end
    end
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
