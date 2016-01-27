require "kleisli"
require "formalist_demo/import"

module Operations
  class SubmitDemo
    include FormalistDemo::Import("forms.demo_form", "validation.demo_schema")

    def call(input)
      validation = demo_schema.call(input)

      if validation.messages.any?
        Left(demo_form.call(
          validation.params,
          rules: demo_schema.rules.map(&:to_ary),
          errors: validation.messages
        ))
      else
        Right(validation.params)
      end
    end
  end
end
