require "rodakase/application"
require_relative "container"

module FormalistDemo
  class Application < Rodakase::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    use Rack::Session::Cookie,
      key: "formalist_demo.session",
      secret: FormalistDemo::Container.options.session_secret

    route do |r|
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
