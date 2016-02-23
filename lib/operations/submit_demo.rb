require "kleisli"
require "forms/demo_form"

module Operations
  class SubmitDemo
    def call(input)
      result = Forms::DemoForm.receive(input).validate
      result.success? ? Right(result) : Left(result)
    end
  end
end
