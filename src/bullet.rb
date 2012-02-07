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
    @moveStrategy = options[:moveStrategy]
  end

  def move
    @location = @moveStrategy.move(@location)
  end
end
