require "dry/matcher/either_matcher"
require "dry/monads/either"
require "demo/form_schema"

module Demo
  class SubmitDemo
    include Dry::Monads::Either::Mixin
    include Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)

    def call(input)
      validation = Demo::FormSchema.(input)

      validation.success? ? Right(validation) : Left(validation)
    end
  end
end
