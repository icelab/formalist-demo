require "formalist_demo/view"

module Views
  class Home < FormalistDemo::View
    configure do |config|
      config.template = "home"
    end
  end
end
