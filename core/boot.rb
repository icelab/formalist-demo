require "byebug" if ENV["RACK_ENV"] != "production"

require_relative "formalist_demo/container"

FormalistDemo::Container.finalize! do |container|
end

require "formalist_demo/application"
require "formalist_demo/view"
