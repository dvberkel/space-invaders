class Bullet
  def initialize(location = Location.new(0,0), boundingBox = BoundingBox.new(0,0))
    @location = location
    @boundingBox = boundingBox
  end

  def location
    return @location
  end

  def boundingBox
    return @boundingBox
  end
end
