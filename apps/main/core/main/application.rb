require "rodakase/application"
require "either_result_matcher/either_extensions"
require_relative "container"

module Main
  class Application < Rodakase::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "formalist_demo.session", secret: FormalistDemo::Container.config.app.session_secret

    plugin :indifferent_params
    plugin :flash

    route do |r|
      self.class.config.container["page"].flash_messages = flash

      r.root do
        r.resolve "views.home" do |home|
          home.()
        end
      end

      r.multi_route
    end

    load_routes!
  end
end
