class Bullet
  attr_reader :location, :boundingBox
  def initialize(options = {})
    options = {
      :location => Location.new(0,0), 
      :boundingBox => BoundingBox.new(0,0),
      :moveStrategy => Linear.new(Location.new(0,5))
    }.merge(options)
    @location = options[:location]
    @boundingBox = options[:boundingBox]
  end

  def move
    @location = @location.displaceBy(Location.new(0,5))
  end
end
