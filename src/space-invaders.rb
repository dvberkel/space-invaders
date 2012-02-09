class SpaceInvaders
  attr_reader :score
  def initialize(startingScore = 0)
    @score = startingScore
    @aliens = []
    @gun = NullGun.new
  end
  
  def notify(event)
    @score = @score + 1
    @aliens.delete(event.alien)
  end

  def move
    @aliens.each {|alien| alien.move}
    @gun.move
  end

  def addAlien(alien)
    alien.addObserver(self)
    @aliens.push(alien)
  end
  
  def addGun(gun)
    @gun = gun
  end
end

class NullGun < Gun
  def move
  end
end
