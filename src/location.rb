class Vector
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def displaceBy(displacement)
    return Vector.new(@x + displacement.x, @y + displacement.y)
  end
  
  def times(scalar)
    return Vector.new(@x * scalar, @y * scalar)
  end

  def ==(vector)
    return @x == vector.x && @y == vector.y
  end
end
