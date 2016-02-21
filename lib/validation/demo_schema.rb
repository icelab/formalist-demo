require "dry-validation"
require "dry/validation/schema/form"

module Validation
  class DemoSchema < Dry::Validation::Schema::Form
    # key(:date_default, &:filled?)
    # key(:datetime_default) { |datetime| datetime.filled? }
    key(:string_default, &:filled?)
    key(:string_password, &:filled?)
    key(:string_code, &:filled?)
    key(:string_select, &:filled?)
    key(:string_radio, &:filled?)
    key(:string_textarea, &:filled?)
    key(:string_huge, &:filled?)
    key(:int_default, &:filled?)
    key(:int_min, &:filled?)
    key(:int_max, &:filled?)
    key(:int_step, &:filled?)
    key(:int_select, &:filled?)
    key(:int_radio, &:filled?)
    key(:float_default, &:filled?)
    key(:float_min, &:filled?)
    key(:float_max, &:filled?)
    key(:float_step, &:filled?)
    key(:float_select, &:filled?)
    key(:float_radio, &:filled?)
    key(:decimal_default, &:filled?)
    key(:default_min, &:filled?)
    key(:default_max, &:filled?)
    key(:default_step, &:filled?)
    key(:decimal_select, &:filled?)
    key(:decimal_radio, &:filled?)
    key(:bool_default, &:bool?)
  end
end
