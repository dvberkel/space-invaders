require 'bullet'

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
end
