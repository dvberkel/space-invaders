require 'bullet'
require 'aliens'
require 'movement'

describe "movement" do
  describe "of bullet" do
    it "should be upward" do
      bullet = Bullet.new

      bullet.move

      bullet.location.should == Location.new(0,5)
    end
    
    it "should be in a straight line upwards" do
      bullet = Bullet.new(Location.new(1,0))

      bullet.move

      bullet.location.should == Location.new(1,5)
    end
  end

  describe "of alien" do
    it "should default be stand still" do
      alien = Alien.new
      
      alien.move

      alien.location.should == Location.new(0,0)
    end

    it "should be determined by a strategy" do
      alien = Alien.new({:moveStrategy => Linear.new(Location.new(1,0))})

      alien.move
      
      alien.location.should == Location.new(1,0)
    end
  end
end
