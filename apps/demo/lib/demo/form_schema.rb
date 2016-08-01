require "dry-validation"

module Demo
  FormSchema = Dry::Validation.Form do
    required(:date_default).filled(:date?)
    required(:datetime_default).filled(:date_time?)
    required(:string_default).filled
    required(:string_password).filled
    required(:string_code).filled
    required(:string_select).filled
    required(:string_radio).filled
    required(:string_textarea).filled
    required(:string_huge).filled
    required(:int_default).filled
    required(:int_min).filled
    required(:int_max).filled
    required(:int_step).filled
    required(:int_select).filled
    required(:int_radio).filled
    required(:float_default).filled
    required(:float_min).filled
    required(:float_max).filled
    required(:float_step).filled
    required(:float_select).filled
    required(:float_radio).filled
    required(:decimal_default).filled
    required(:default_min).filled
    required(:default_max).filled
    required(:default_step).filled
    required(:decimal_select).filled
    required(:decimal_radio).filled
    required(:bool_default).filled(:bool?)
  end
end
