require "rack/csrf"
require "dry/web/roda/application"
require_relative "container"
require "roda_plugins"

module Demo
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "demo.session", secret: FormalistDemo::Container.settings.session_secret
    use Rack::Csrf, raise: true

    plugin :flash

    plugin :view
    plugin :page
    plugin :json

    route do |r|
      r.multi_route

      r.root do
        r.redirect "/form"
      end
    end

    load_routes!
  end
end
