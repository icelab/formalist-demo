require "bundler/setup"

require "byebug" unless ENV["RACK_ENV"] == "production"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
rescue LoadError
end

require_relative "umbrella/formalist_demo/container"
