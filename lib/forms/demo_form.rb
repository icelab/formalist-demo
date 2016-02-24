require "formalist"
require "validation/demo_schema"

module Forms
  DemoForm = Class.new(Formalist::Form) do
    # section :date do |section|
    #   section.field :date_default, type: "date", label: "Date (default)"
    # end
    # section :datetime do |section|
    #   section.field :datetime_default, type: "date_time", label: "Date-time (default)"
    # end
    section :string do |section|
      section.field :string_default,  type: "string", label: "String (default)",  placeholder: "Default string type"
      section.field :string_password, type: "string", label: "String (password)", placeholder: "Secret squirrel", password: true, inline: true
      section.field :string_code,     type: "string", label: "String (default) with code", placeholder: "Enter the matrix", display_options: ["code"]
      section.field :string_select,   type: "string", label: "String (select)",   display: "select", placeholder: "Select your favourite number", option_values: ["One", "Two", "Three"]
      section.field :string_radio,    type: "string", label: "String (radio)",    display: "radio", option_values: ["One", "Two", "Three"]
      section.field :string_textarea, type: "string", label: "String (textarea)", display: "textarea", placeholder: "Enter some text in a larger area", hint: "You can enter text over more than one line."
      section.field :string_huge,     type: "string", label: "String (textarea) huge", display: "textarea", placeholder: "Enter some text in a larger area", hint: "You can enter text over more than one line.", size: 'huge'
    end
    section :int do |section|
      section.field :int_default, type: "int", label: "Int (default)", placeholder: "Default int input"
      section.field :int_min,     type: "int", label: "Int (default) with min 10", placeholder: "Default int input", min: 10
      section.field :int_max,     type: "int", label: "Int (default) with max 10", placeholder: "Default int input", max: 10
      section.field :int_step,    type: "int", label: "Int (default) with step 5", placeholder: "Default int input", step: 5
      section.field :int_select,  type: "int", label: "Int (select)", display: "select", placeholder: "Select your favourite number", option_values: [[1, "One"], [2, "Two"], [3, "Three"]]
      section.field :int_radio,   type: "int", label: "Int (radio)",  display: "radio", option_values: [[1, "One"], [2, "Two"], [3, "Three"]]
    end
    section :float do |section|
      section.field :float_default, type: "float", label: "Float (default)", placeholder: "Default float input"
      section.field :float_min,     type: "float", label: "Float (default) with min 10", placeholder: "Default float input", min: 10
      section.field :float_max,     type: "float", label: "Float (default) with max 10", placeholder: "Default float input", max: 10
      section.group do |group|
        group.field :float_step,    type: "float", label: "Float (default) with step 0.025", placeholder: "Default float input", step: 0.025
        group.field :float_select,  type: "float", label: "Float (select)", display: "select", placeholder: "Select your favourite number", option_values: [[1.1, "1.1"], [2.4, "2.4"], [3.14159265359, "π"]]
      end
      section.field :float_radio,   type: "float", label: "Float (radio)",  display: "radio", option_values: [[1.1, "1.1"], [2.4, "2.4"], [3.14159265359, "π"]]
    end
    section :decimal do |section|
      section.field :decimal_default, type: "decimal", label: "Decimal (default)", placeholder: "Default decimal input"
      section.field :default_min,     type: "decimal", label: "Decimal (default) with min 0.55", placeholder: "Default decimal input", min: 0.55
      section.field :default_max,     type: "decimal", label: "Decimal (default) with max 10.55", placeholder: "Default decimal input", max: 10.55
      section.field :default_step,    type: "decimal", label: "Decimal (default) with step 0.55", placeholder: "Default decimal input", step: 0.55
      section.field :decimal_select,  type: "decimal", label: "Decimal (select)",  display: "select", placeholder: "Select your favourite number", option_values: [[1.1, "1.1"], [2.4, "2.4"], [3.14159265359, "π"]]
      section.field :decimal_radio,   type: "decimal", label: "Decimal (radio)",   display: "radio", option_values: [[1.1, "1.1"], [2.4, "2.4"], [3.14159265359, "π"]]
    end
    section :bool do |section|
      section.field :bool_default, type: "bool", label: "Bool (default)", question_text: "Do you like me?"
    end
  end.new(Validation::DemoSchema)
end
