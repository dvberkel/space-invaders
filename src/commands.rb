class CommandFactory
  def self.createCommandFrom(event)
    if (event.type == :alienDied)
      return AlienDiedCommand.new(event.alien)
    elsif (event.type == :gunFired)
      return GunFiredCommand.new(event.bullet)
    elsif (event.type == :bulletExploded)
      return BulletExplodedCommand.new(event.bullet)
    end
    return NullCommand.new
  end
end

class AlienDiedCommand
  def initialize(alien)
    @alien = alien
  end

  def perform(game)
    game.increaseScore(1)
    game.removeAlien(@alien)
  end
end

class GunFiredCommand
  def initialize(bullet)
    @bullet = bullet
  end
  
  def perform(game)
    game.addBullet(@bullet)
  end
end

class BulletExplodedCommand
  def initialize(bullet)
    @bullet = bullet
  end
  
  def perform(game)
    game.removeBullet(@bullet)
  end
end

class NullCommand
  def perform(game)
    # do nothing
  end
end
