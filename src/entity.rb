class Entity < Observable
  @@currentId = 0

  def self.nextId()
    @@currentId += 1
  end
  
  attr_reader :id
  def initialize
    super()
    @id = Entity.nextId()
  end
end
