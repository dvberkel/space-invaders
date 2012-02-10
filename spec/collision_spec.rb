require 'collision-detector'

describe "collision-detector" do
  before(:each) do
    @detector = CollisionDetector.new
  end

  before(:each) do
    @alien = Alien.new({:location => Vector.new(0,0), :boundingBox => BoundingBox.new(4,4)})
  end
  
  it "should detect an dead on collision" do
    bullet = Bullet.new({:location => Vector.new(0,0)})
    
    @detector.collides?(@alien,bullet).should == true
  end

  it "should not detect a collision when way off." do
    bullet = Bullet.new({:location => Vector.new(6,0)})

    @detector.collides?(@alien, bullet).should == false
  end

  it "should detect a glancing blow" do
    bullet = Bullet.new({:location => Vector.new(0,-4)})

    @detector.collides?(@alien, bullet).should == true
  end
end
