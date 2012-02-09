require 'space-invaders'

describe "space-invaders" do
  before(:each) do
    @game = SpaceInvaders.new
  end

  it "should monitor aliens" do
    alien = Alien.new
    @game.addAlien(alien)

    alien.die

    @game.score.should == 1
  end

  it "should move monitored aliens" do
    alien = Alien.new({:moveStrategy => Linear.new(Location.new(1,0))})
    @game.addAlien(alien)

    @game.move

    alien.location.should == Location.new(1,0)
  end

  it "should not move dead aliens" do
    alien = Alien.new({:moveStrategy => Linear.new(Location.new(1,0))})
    @game.addAlien(alien)
    
    alien.die
    @game.move

    alien.location.should == Location.new(0,0)
  end

  it "should monitor guns and move them" do
    gun = Gun.new({:moveStrategy => Linear.new(Location.new(1,0))})
    @game.addGun(gun)

    @game.move

    gun.location.should == Location.new(1,0)
  end
 end
