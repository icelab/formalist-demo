require "json"
require "formalist_demo/view"
require "forms/demo_form"

module Views
  class Demo < FormalistDemo::View
    configure do |config|
      config.template = "demo"
    end

    def locals(options = {})
      result = options[:result]
      input = result ? result.output : {}
      errors = result ? result.messages : {}

      form = Forms::DemoForm.build(input, errors)

      {ast: form.to_ast.to_json}
    end
  end
end
