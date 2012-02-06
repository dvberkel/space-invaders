class SpaceInvaders
  attr_reader :score
  def initialize(startingScore = 0)
    @score = startingScore
  end
  
  def notify(event)
    @score = @score + 1
  end
end
