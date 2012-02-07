class Location
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def displaceBy(displacement)
    return Location.new(@x + displacement.x, @y + displacement.y)
  end

  def ==(location)
    return @x == location.x && @y == location.y
  end
end
