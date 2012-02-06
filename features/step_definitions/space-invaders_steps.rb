$LOAD_PATH << './src'
require 'space-invaders'

Given /^a new space invaders game$/ do
  @game = SpaceInvaders.new
end

When /^a score is asked$/ do
  @score = @game.score
end

Then /^the player scored (\d+)$/ do |expectedScore|
  @score.should equal expectedScore.to_i
end
