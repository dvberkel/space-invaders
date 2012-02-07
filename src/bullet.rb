class Bullet
  attr_reader :location, :boundingBox
  def initialize(location = Location.new(0,0), boundingBox = BoundingBox.new(0,0))
    @location = location
    @boundingBox = boundingBox
  end

  def move
    @location = @location.displaceBy(Location.new(0,5))
  end
end
