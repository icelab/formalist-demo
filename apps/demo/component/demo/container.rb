require "pathname"
require "dry/web/container"

module Demo
  class Container < Dry::Web::Container
    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze
      config.default_namespace = "demo"

      config.auto_register = %w[lib/demo]
    end

    load_paths! "lib", "component"
  end
end
