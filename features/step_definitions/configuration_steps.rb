
Given /^a member checked out the space invaders project$/ do
  @check = CucumberCheck.new
end

When /^the member runs cucumber$/ do
  @check.configure
end

Then /^a cucumber report should be presented$/ do
  @check.configured?.should be_true
end

class CucumberCheck
  def initialize()
    @configured = false
  end

  def configure()
    @configured = true
  end

  def configured?()
    @configured
  end
end
