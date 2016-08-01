require_relative "demo/container"

Demo::Container.finalize! do |container|
end

require "demo/application"
require "demo/view"
require "demo/transactions"

Demo::Container.require "transactions/**/*.rb"
