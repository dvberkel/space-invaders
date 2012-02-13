require 'aliens'
require 'bullet'
require 'location'
require 'collision-detector'

describe "alien" do
  describe "death" do
    before(:each) do
      @observer = AlienObserver.new
    end
    
    before(:each) do
      @alien = Alien.new
    end
    
    it "should not be notified if still alife" do
      @alien.addObserver(@observer)
      
      @observer.alienDied?.should == false
    end
    
    it "should notify death" do
      @alien.addObserver(@observer)
      
      @alien.die
      
      @observer.alienDied?.should == true
    end
  end
  
  describe("move") do
    before(:each) do
      @observer = AlienObserver.new
    end

    it "should default do nothing" do
      alien = Alien.new

      alien.move

      alien.location.should == Vector.new(0,0)
    end

    it "should default not notify movement" do
      alien = Alien.new
      alien.addObserver(@observer)

      alien.move

      @observer.alienMoved?.should == false
    end

    it "should be determined by a move strategy" do
      alien = Alien.new({:moveStrategy => Linear.new(Vector.new(0,3))})

      alien.move

      alien.location.should == Vector.new(0,3)
    end
    
    it "should be notified" do
      alien = Alien.new({:moveStrategy => Linear.new(Vector.new(3,0))})
      alien.addObserver(@observer)

      alien.move

      @observer.alienMoved?.should == true
    end
  end
end
  
class AlienObserver
  def initialize
    @alienDied = false
    @alienMoved = false
  end
  
  def notify(event)
    @alienDied = true
    @alienMoved = true
  end

  def alienDied?
    return @alienDied
  end

  def alienMoved?
    return @alienMoved
  end
end
