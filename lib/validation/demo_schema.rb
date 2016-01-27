require "dry-validation"
require "dry/validation/schema/form"

module Validation
  class DemoSchema < Dry::Validation::Schema::Form
    key(:name, &:filled?)
    key(:title) { |title| title.inclusion?(["Lord", "Lady", "Wing Commander"]) }
    key(:age, &:filled?)
    key(:published, &:bool?)
  end
end
