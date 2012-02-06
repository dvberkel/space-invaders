require 'collision-detector'

describe "being hit" do
  before(:each) do
    @detector = CollisionDetector.new
  end
  
  it "should hit an alien dead on" do
    alien = Alien.new(Location.new(0,0))
    bullet = Bullet.new(Location.new(0,0))
    
    @detector.collides?(alien,bullet).should == true
  end

  it "should mis an alien if it is to the right of its bounding box" do
    alien = Alien.new(Location.new(0,0), BoundingBox.new(4,4))
    bullet = Bullet.new(Location.new(6,0))

    @detector.collides?(alien, bullet).should == false
  end

  it "should mis an alien if it is below of its bounding box" do
    alien = Alien.new(Location.new(0,0), BoundingBox.new(4,4))
    bullet = Bullet.new(Location.new(0,-6))

    @detector.collides?(alien, bullet).should == false
  end
end
