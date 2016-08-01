require "dry/web/umbrella"
require_relative "settings"

module FormalistDemo
  class Container < Dry::Web::Umbrella
    configure do |config|
      config.name = :core
      config.core_dir = "umbrella".freeze
      config.settings_loader = FormalistDemo::Settings
    end

    load_paths! "lib", "umbrella"

    def self.settings
      config.settings
    end
  end
end
