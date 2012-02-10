class CollisionDetector
  def collides?(this, that)
    this.boundingBox().at(this.location).overlaps?(that.boundingBox().at(that.location()))
  end
end

class BoundingBox
  attr_reader :width, :height, :location
  def initialize(width, height, location = Vector.new(0,0))
    @width = width
    @height = height
    @location = location
  end
  
  def at(location)
    return BoundingBox.new(@width, @height, location)
  end

  def overlaps?(boundingBox)
    return ((self.location.x - boundingBox.location.x).abs <= (self.width + boundingBox.width) &&
      (self.location.y - boundingBox.location.y).abs <= (self.height + boundingBox.height))
  end
end
