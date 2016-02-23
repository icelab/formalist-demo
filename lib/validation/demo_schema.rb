require "dry-validation"

module Validation
  DemoSchema = Class.new(Dry::Validation::Schema) do
    key(:date_default).required(:date?)
    key(:datetime_default).required(:date_time?)
    key(:string_default).required
    key(:string_password).required
    key(:string_code).required
    key(:string_select).required
    key(:string_radio).required
    key(:string_textarea).required
    key(:string_huge).required
    key(:int_default).required
    key(:int_min).required
    key(:int_max).required
    key(:int_step).required
    key(:int_select).required
    key(:int_radio).required
    key(:float_default).required
    key(:float_min).required
    key(:float_max).required
    key(:float_step).required
    key(:float_select).required
    key(:float_radio).required
    key(:decimal_default).required
    key(:default_min).required
    key(:default_max).required
    key(:default_step).required
    key(:decimal_select).required
    key(:decimal_radio).required
    key(:bool_default).required(:bool?)
  end.new
end
