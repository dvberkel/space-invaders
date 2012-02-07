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
end
  
class AlienObserver
  def initialize
    @alienDied = false
  end
  
  def notify(event)
    @alienDied = true
  end

  def alienDied?
    return @alienDied
  end
end
