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
    if (event.type == :alienDied)
      @score = @score + 1
      @aliens.delete(event.alien)
    elsif (event.type == :gunFired)
      @bullets.push(event.bullet)
    end
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
  
  def addGun(gun)
    gun.addObserver(self)
    @gun = gun
  end
end

class NullGun < Gun
  def move
  end
end
