require "json"
require "demo/view"
require "demo/import"

module Demo
  module Views
    module Form
      class Show < Demo::View
        include Demo::Import["form"]

        configure do |config|
          config.template = "forms/show"
        end

        def locals(options = {})
          built_form = form.build(
            options.fetch(:input, {}),
            options.key?(:validation) ? options[:validation].errors : {},
          )

          super.merge(form: built_form)
        end
      end
    end
  end
end
