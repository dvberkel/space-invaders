class SpaceInvaders
  def initialize(startingScore = 0)
    @score = startingScore
  end

  def score
    @score
  end
  
  def notify(event)
    @score = @score + 1
  end
end
