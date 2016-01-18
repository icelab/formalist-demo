require "json"
require "formalist_demo/import"
require "formalist_demo/view"

module Views
  class Demo < FormalistDemo::View
    include FormalistDemo::Import("forms.demo")

    configure do |config|
      config.template = "demo"
    end

    def locals(options = {})
      {ast: demo.().to_ary.to_json}
    end
  end
end
