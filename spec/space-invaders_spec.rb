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
    alien = Alien.new({:moveStrategy => Linear.new(Vector.new(1,0))})
    @game.addAlien(alien)

    @game.move

    alien.location.should == Vector.new(1,0)
  end

  it "should not move dead aliens" do
    alien = Alien.new({:moveStrategy => Linear.new(Vector.new(1,0))})
    @game.addAlien(alien)
    
    alien.die
    @game.move

    alien.location.should == Vector.new(0,0)
  end

  it "should monitor guns and move them" do
    gun = Gun.new({:moveStrategy => Linear.new(Vector.new(1,0))})
    @game.addGun(gun)

    @game.move

    gun.location.should == Vector.new(1,0)
  end
 
  it "should kill aliens that are fired upon" do
    alien = Alien.new({:location => Vector.new(0,5)})
    @game.addAlien(alien)
    gun = Gun.new({:location => Vector.new(0,0)})
    @game.addGun(gun)
    
    gun.fire
    @game.move
    @game.collisionDetection

    @game.score.should == 1
  end

  it "should not move exploded bullets" do
    bullet = Bullet.new
    @game.addBullet(bullet)

    bullet.explode
    @game.move

    bullet.location.should == Vector.new(0,0)
  end

  it "should not receive points for already dead aliens" do
    alien = Alien.new
    @game.addAlien(alien)
    
    alien.die
    alien.die

    @game.score.should == 1
  end
 end
