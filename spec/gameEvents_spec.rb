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
    bullet = Bullet.new({moveStrategy: Linear.new(Vector.new(0,1))})
    @game.addBullet(bullet)

    bullet.move

    event = @observer.event()
    event.type().should == :bulletMoved
    event.id().should match /b\d+/
    event.location().should == Vector.new(0,1)
  end

  it "moving a gun" do
    gun = Gun.new({moveStrategy: Linear.new(Vector.new(1,0))})
    @game.addBullet(gun)

    gun.move

    event = @observer.event()
    event.type().should == :gunMoved
    event.id().should == "g"
    event.location().should == Vector.new(1,0)
  end

  it "moving an alien" do
    alien = Alien.new({moveStrategy: Linear.new(Vector.new(1,0))})
    @game.addAlien(alien)

    alien.move
    
    event = @observer.event()
    event.type().should == :alienMoved
    event.id().should match /a\d+/
    event.location().should == Vector.new(1,0)
  end

  it "moving different bullets" do
    bulletA = Bullet.new
    bulletB = Bullet.new
    @game.addBullet(bulletA)
    @game.addBullet(bulletB)

    bulletA.move
    eventA = @observer.event()
    bulletB.move
    eventB = @observer.event()
    
    eventA.id().should_not == eventB.id()
  end

  it "moving different aliens" do
    alienA = Alien.new({moveStrategy: Linear.new(Vector.new(1,0))})
    alienB = Alien.new({moveStrategy: Linear.new(Vector.new(1,0))})
    @game.addAlien(alienA)
    @game.addAlien(alienB)

    alienA.move
    eventA = @observer.event()
    alienB.move
    eventB = @observer.event()
    
    eventA.id().should_not == eventB.id()
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
