describe "the events game fires when" do
  before (:each) do
    @game = SpaceInvaders.new
  end

  before(:each) do
    @observer = EventObserver.new
    @game.addObserver(@observer)
  end
  
  it "adding an alien" do
    @game.addAlien(Alien.new)

    @observer.event().type().should == :alienAdded
  end

  it "adding a gun" do
    @game.addGun(Gun.new)

    @observer.event().type().should == :gunAdded
  end

  it "firing a bullet" do
    gun = Gun.new
    @game.addGun(gun)

    gun.fire

    @observer.event().type().should == :gunFired
  end

  it "exploding a bullet" do
    bullet = Bullet.new
    @game.addBullet(bullet)
    
    bullet.explode

    @observer.event().type().should == :bulletExploded
  end

  it "killing an alien" do
    alien = Alien.new
    @game.addAlien(alien)
    
    alien.die

    @observer.event().type().should == :alienDied
  end

  it "moving a bullet" do
    bullet = Bullet.new
    @game.addBullet(bullet)

    bullet.move

    @observer.event().type().should == :bulletMoved
  end

  it "moving a gun" do
    gun = Gun.new({moveStrategy: Linear.new(Vector.new(1,0))})
    @game.addBullet(gun)

    gun.move

    @observer.event().type().should == :gunMoved
  end

  it "moving a alien" do
    alien = Alien.new({moveStrategy: Linear.new(Vector.new(1,0))})
    @game.addBullet(alien)

    alien.move

    @observer.event().type().should == :alienMoved
  end
end

class EventObserver
  attr_reader :event
  def initialize()
    @event = nil
  end

  def notify(event)
    @event = event
  end
end
