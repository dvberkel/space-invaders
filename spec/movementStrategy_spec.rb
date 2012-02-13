require 'movement'
require 'events'

describe "event strategy" do
  it "should move right after right notification" do
    strategy = EventedMoveStrategy.new

    strategy.notify(RightSignaled.new)

    strategy.move(Vector.new(0,0)).should == Vector.new(1,0)
  end

  it "should move left after left notification" do
    strategy = EventedMoveStrategy.new

    strategy.notify(LeftSignaled.new)

    strategy.move(Vector.new(0,0)).should == Vector.new(-1,0)
  end

  it "should move accordingly to the signaled events" do
    strategy = EventedMoveStrategy.new

    strategy.notify(RightSignaled.new)
    strategy.notify(RightSignaled.new)
    strategy.notify(RightSignaled.new)
    strategy.notify(LeftSignaled.new)

    strategy.move(Vector.new(0,0)).should == Vector.new(2,0)
  end
end
