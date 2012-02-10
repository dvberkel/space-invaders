class Bullet < Observable
  attr_reader :location, :boundingBox
  def initialize(options = {})
    super()
    options = {
      :location => Vector.new(0,0), 
      :boundingBox => BoundingBox.new(0,0),
      :moveStrategy => Linear.new(Vector.new(0,5))
    }.merge(options)
    @location = options[:location]
    @boundingBox = options[:boundingBox]
    @moveStrategy = options[:moveStrategy]
  end

  def move
    @location = @moveStrategy.move(@location)
  end
  
  def explode
    notifyAll(BulletExploded.new(self))
  end
end
