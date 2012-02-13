require 'commands'
require 'gun'

class SpaceInvaders
  attr_reader :score
  def initialize(startingScore = 0)
    @detector = CollisionDetector.new
    @score = startingScore
    @aliens = []
    @bullets = []
    @gun = NullGun.new
  end
  
  def notify(event)
    command = CommandFactory.createCommandFrom(event)
    command.perform(self)
  end

  def increaseScore(by=1)
    @score = @score + 1
  end

  def move
    @aliens.each {|alien| alien.move}
    @bullets.each {|bullet| bullet.move}
    @gun.move
  end
  
  def collisionDetection
    exploded = []
    died = []
    @bullets.each do |bullet|
      @aliens.each do |alien|
        if (@detector.collides?(bullet,alien))
          exploded.push(bullet)
          died.push(alien)
        end
      end
    end
    exploded.each {|bullet| bullet.explode}
    died.each {|alien| alien.die}
  end

  def addAlien(alien)
    alien.addObserver(self)
    @aliens.push(alien)
  end

  def removeAlien(alien)
    @aliens.delete(alien)
    alien.removeObserver(self)
  end
  
  def addGun(gun)
    gun.addObserver(self)
    @gun = gun
  end

  def addBullet(bullet)
    bullet.addObserver(self)
    @bullets.push(bullet)
  end
  
  def removeBullet(bullet)
    @bullets.delete(bullet)
    bullet.removeObserver(self)
  end
end

class NullGun < Gun
  def move
  end
end
