class Observable
  def initialize()
    @observers = []
  end

  def notifyAll(event)
    @observers.each do |observer|
      observer.notify(event)
    end
  end


  def addObserver(observer)
    @observers.push(observer)
  end
end
