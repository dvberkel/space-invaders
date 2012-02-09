class Event
  attr_reader :type
  def initialize(type)
    @type = type
  end
end

class AlienDied < Event
  attr_reader :alien
  def initialize(alien)
    super(:alienDied)
    @alien = alien
  end
end

class GunFired < Event
  attr_reader :bullet
  def initialize(bullet)
    super(:gunFired)
    @bullet = bullet
  end
end

class GunMoved < Event
  def initialize
    super(:gunMoved)
  end
end

class BulletExploded < Event
  def initialize
    super(:bulletExploded)
  end
end
