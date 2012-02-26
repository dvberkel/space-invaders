describe "bullet" do
  it "should not notify if no explosion occured" do
    bullet = Bullet.new
    observer = BulletObserver.new
    bullet.addObserver(observer)

    # do nothing

    observer.exploded?.should == false
  end

  it "should notify explosion" do
    bullet = Bullet.new
    observer = BulletObserver.new
    bullet.addObserver(observer)

    bullet.explode

    observer.exploded?.should == true
  end

  it "should explode when it moves above 800" do
    bullet = Bullet.new({:location => Vector.new(0,799)})
    observer = BulletObserver.new
    bullet.addObserver(observer)

    bullet.move

    observer.exploded?.should == true
  end
end

class BulletObserver
  def initialize
    @exploded = false
  end

  def notify(event)
    if event.type == :bulletExploded
      @exploded = true
    end
  end

  def exploded?
    @exploded
  end
end
