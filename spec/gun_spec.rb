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

      gun.location.should == Vector.new(0,0)
    end

    it "should default not notify movement" do
      gun = Gun.new
      gun.addObserver(@observer)

      gun.move

      @observer.gunMoved?.should == false
    end

    it "should be determined by a move strategy" do
      gun = Gun.new({:moveStrategy => Linear.new(Vector.new(0,3))})

      gun.move

      gun.location.should == Vector.new(0,3)
    end
    
    it "should be notified" do
      gun = Gun.new({:moveStrategy => Linear.new(Vector.new(3,0))})
      gun.addObserver(@observer)

      gun.move

      @observer.gunMoved?.should == true
    end
  end
  
  describe("events") do
    it "should make the gun move" do
      strategy = EventedMoveStrategy.new
      gun = Gun.new({:moveStrategy => strategy})
      
      gun.notify(RightSignaled.new)
      gun.notify(RightSignaled.new)
      gun.move

      gun.location.should == Vector.new(2,0)
    end

    it "should make the gun fire" do
      observer = GunObserver.new
      gun = Gun.new
      gun.addObserver(observer)
      
      gun.notify(FireSignaled.new)

      observer.gunFired?.should == true
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
