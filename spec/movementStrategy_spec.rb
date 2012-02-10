require 'movement'
require 'events'

describe "event strategy" do
  it "should move right after right notification" do
    strategy = EventedMoveStrategy.new

    strategy.notify(RightSignaled.new)

    strategy.move(Location.new(0,0)).should == Location.new(1,0)
  end

  it "should move left after left notification" do
    strategy = EventedMoveStrategy.new

    strategy.notify(LeftSignaled.new)

    strategy.move(Location.new(0,0)).should == Location.new(-1,0)
  end
end
