require 'rubygems'
require 'bundler/setup'

require 'rspec/core/rake_task'
require 'cucumber/rake/task'

task :default => [:test]

desc "Run all test tasks"
task :test => [:rspec, :cucumber] do
  puts "Testing stage finished."
end

desc "Run cucumber on the features directory"
Cucumber::Rake::Task.new('cucumber') do |task|
  task.cucumber_opts = ["features"]
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
  t.rspec_opts = ['-I src']
  t.pattern = 'spec/**/*_spec.rb'
end
