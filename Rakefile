require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"
require "appraisal/task"
require "rspec/core/rake_task"

Appraisal::Task.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

if !ENV["APPRAISAL_INITIALIZED"] && !ENV["TRAVIS"]
  task :default => :appraisal
else
  task :default => :spec
end
