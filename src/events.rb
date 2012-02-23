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

class Moved < Event
  attr_reader :id
  def initialize(type, id)
    super(type)
    @id = id
  end
end

class AlienMoved < Moved
  def initialize
    super(:alienMoved, "a0")
  end
end

class AlienAdded < Event
  attr_reader :alien
  def initialize(alien)
    super(:alienAdded)
  end
end

class GunFired < Event
  attr_reader :bullet
  def initialize(bullet)
    super(:gunFired)
    @bullet = bullet
  end
end

class GunMoved < Moved
  def initialize
    super(:gunMoved, "g")
  end
end

class GunAdded < Event
  def initialize(gun)
    super(:gunAdded)
  end
end

class BulletExploded < Event
  attr_reader :bullet
  def initialize(bullet)
    super(:bulletExploded)
    @bullet = bullet
  end
end

class BulletMoved < Moved
  def initialize
    super(:bulletMoved, "b0")
  end
end

class RightSignaled < Event
  def initialize
    super(:rightSignaled)
  end
  
  def direction
    return 1
  end
end

class LeftSignaled < Event
  def initialize
    super(:leftSignaled)
  end

  def direction
    return -1
  end
end


class FireSignaled < Event
  def initialize
    super(:fireSignaled)
  end
end
