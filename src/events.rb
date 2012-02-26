class Event
  attr_reader :type
  def initialize(type)
    @type = type
  end
end

class IdEvent < Event
  attr_reader :id
  def initialize(type, id)
    super(type)
    @id = id
  end
end

class Moved < IdEvent
  attr_reader :location
  def initialize(type, id, location)
    super(type, id)
    @location = location
  end
end

class Finished < IdEvent
end

class AlienDied < Finished
  attr_reader :alien
  def initialize(alien)
    super(:alienDied, alien.id)
    @alien = alien
  end
end

class AlienMoved < Moved
  def initialize(alien)
    super(:alienMoved, alien.id, alien.location)
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
  def initialize(gun)
    super(:gunMoved, gun.id, gun.location)
  end
end

class GunAdded < Event
  def initialize(gun)
    super(:gunAdded)
  end
end

class BulletExploded < Finished
  attr_reader :bullet
  def initialize(bullet)
    super(:bulletExploded, bullet.id)
    @bullet = bullet
  end
end

class BulletMoved < Moved
  def initialize(bullet)
    super(:bulletMoved, bullet.id(), bullet.location)
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
