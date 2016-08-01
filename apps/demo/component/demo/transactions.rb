require "dry-transaction"
require "formalist_demo/transactions"
require "demo/container"
require "demo/import"

module Demo
  class Transactions < FormalistDemo::Transactions
    configure do |config|
      config.container = Demo::Container
    end
  end
end
