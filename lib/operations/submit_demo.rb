require "kleisli"

module Operations
  class SubmitDemo
    def call(input)
      result = Validation::DemoSchema.(input)
      result.success? ? Right(result) : Left(result)
    end
  end
end
