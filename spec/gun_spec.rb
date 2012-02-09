require 'gun'

describe("gun") do
  describe("shooting") do
    before(:each) do
      @gun = Gun.new
    end

    before(:each) do
      @observer = GunObserver.new
    end

    it "should send a bullet fired event when firing" do
      @gun.addObserver(@observer)
      
      @gun.fire
      
      @observer.gunFired?.should == true
    end

    it "should send nothing when not firing" do
      @gun.addObserver(@observer)
      
      # do nothing
      
      @observer.gunFired?.should == false
    end
  end

  describe("move") do
    before(:each) do
      @observer = GunObserver.new
    end

    it "should default do nothing" do
      gun = Gun.new

      gun.move

      gun.location.should == Location.new(0,0)
    end

    it "should default do notify movement" do
      gun = Gun.new
      gun.addObserver(@observer)

      gun.move

      @observer.gunMoved?.should == false
    end

    it "should be determined by a move strategy" do
      gun = Gun.new({:moveStrategy => Linear.new(Location.new(0,3))})

      gun.move

      gun.location.should == Location.new(0,3)
    end
    
    it "should be notified" do
      gun = Gun.new({:moveStrategy => Linear.new(Location.new(3,0))})
      gun.addObserver(@observer)

      gun.move

      @observer.gunMoved?.should == true
    end
  end
end

class GunObserver
  def initialize
    @fired = false
    @moved = false
  end
  
  def notify(event)
    @fired = true
    @moved = true
  end

  def gunFired?
    @fired
  end

  def gunMoved?
    @moved
  end
end
