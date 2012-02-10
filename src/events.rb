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
  attr_reader :bullet
  def initialize(bullet)
    super(:bulletExploded)
    @bullet = bullet
  end
end

class RightSignaled < Event
  def initialize
    super(:rightSignaled)
  end
end

class LeftSignaled < Event
  def initialize
    super(:leftSignaled)
  end
end
