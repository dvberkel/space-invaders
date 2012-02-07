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
end

class GunObserver
  def initialize
    @fired = false
  end
  
  def notify(event)
    @fired = true
  end

  def gunFired?
    @fired
  end
end
