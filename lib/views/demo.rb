require "json"
require "formalist_demo/view"
require "forms/demo_form"

module Views
  class Demo < FormalistDemo::View
    configure do |config|
      config.template = "demo"
    end

    def locals(options = {})
      form = options.fetch(:form) { Forms::DemoForm.build }

      {ast: form.to_ast.to_json}
    end
  end
end
