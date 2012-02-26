require 'space-invaders'
require 'aliens'
require 'location'

class Game < SpaceInvaders
  def start
    @strategy = ZigZag.new(Vector.new(3,0), -400, 400, 5)
    (-4..4).each do |ix|
      (0..2).each do |iy|
        x,y = 80 * ix, 500 - 50 * iy
        addAlien(Alien.new({:location => Vector.new(x,y), :moveStrategy => @strategy}))
      end
    end
    @gun = Gun.new({:moveStrategy => EventedMoveStrategy.new(Vector.new(3,0))})
    addGun(@gun)
  end

  def tick
    @strategy.determineDirection
    move
    collisionDetection
  end

  def signal(signal)
    @gun.notify(signal)
  end
end

class ZigZag < MovementStrategy
  def initialize(displacement, minimum, maximum, drop)
    @displacement = displacement
    @minimum = minimum
    @maximum = maximum
    @drop = Vector.new(0,-drop)
    @direction = 1
    @shouldSwitch = false
    @shouldDrop = false
  end

  def move(location)
    if (@direction > 0 and location.x > @maximum) or (@direction < 0 and location.x < @minimum)
      @shouldSwitch = true
    end
    if @shouldDrop
      location = location.displaceBy(@drop)
    end
    location.displaceBy(@displacement.times(@direction))   
  end

  def determineDirection 
    if @shouldDrop
      @shouldDrop = false
    end
    if @shouldSwitch
      @direction *= -1
      @shouldSwitch = false
      @shouldDrop = true
    end
  end
end
