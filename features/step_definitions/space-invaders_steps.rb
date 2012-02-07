require 'space-invaders'
require 'events'

Given /^a new space invaders game$/ do
  @game = SpaceInvaders.new
end

Given /^a space invaders game at (\d+) points$/ do |startingScore|
  @game = SpaceInvaders.new(startingScore.to_i)
end

Given /^the game received an alien died event$/ do
  @game.notify DiedEvent.new
end

When /^a score is asked$/ do
  @score = @game.score
end

Then /^the player scored (\d+)$/ do |expectedScore|
  @score.should == expectedScore.to_i
end
