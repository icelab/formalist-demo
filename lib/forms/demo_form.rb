require "formalist"
require "formalist/elements/standard"
require "validation/demo_schema"

module Forms
  DemoForm = Class.new(Formalist::Form) do
    define do
      section :date do
        date_field :date_default, label: "Date (default)"
      end

      section :datetime do
        date_time_field :date_time_default, label: "Date-time (default)"
      end

      section :string do
        text_field :string_default,
          label: "String (default)",
          placeholder: "Default string type"

        text_field :string_password,
          label: "String (password)",
          placeholder: "Secret squirrel",
          password: true

        text_field :string_code,
          label: "String (default) with code",
          placeholder: "Enter the matrix",
          code: true

        select_box :string_select,
          label: "String (select)",
          placeholder: "Select your favourite number",
          options: [["1", "One"], ["2", "Two"], ["3", "Three"]]

        radio_buttons :string_radio,
          label: "String (radio)",
          options: [["1", "One"], ["2", "Two"], ["3", "Three"]]

        text_area :string_textarea,
          label: "String (textarea)",
          placeholder: "Enter some text in a larger area",
          hint: "You can enter text over more than one line."

        text_area :string_huge,
          label: "String (textarea) huge",
          placeholder: "Enter some text in a larger area",
          hint: "You can enter text over more than one line.",
          box_size: "xlarge"
      end

      section :int do
        number_field :int_default,
          label: "Int (default)",
          placeholder: "Default int input"

        number_field :int_min,
          label: "Int (default) with min 10",
          placeholder: "Default int input",
          min: 10

        number_field :int_max,
          label: "Int (default) with max 10",
          placeholder: "Default int input",
          max: 10

        number_field :int_step,
          label: "Int (default) with step 5",
          placeholder: "Default int input",
          step: 5

        select_box :int_select,
          label: "Int (select)",
          placeholder: "Select your favourite number",
          options: [["1", "One"], ["2", "Two"], ["3", "Three"]]

        radio_buttons :int_radio,
          label: "Int (radio)",
          options: [["1", "One"], ["2", "Two"], ["3", "Three"]]
      end

      section :float do
        number_field :float_default,
          label: "Float (default)",
          placeholder: "Default float input"

        number_field :float_min,
          label: "Float (default) with min 10",
          placeholder: "Default float input",
          min: 10

        number_field :float_max,
          label: "Float (default) with max 10",
          placeholder: "Default float input",
          max: 10

        group do
          number_field :float_step,
            label: "Float (default) with step 0.025",
            placeholder: "Default float input", step: 0.025

          select_box :float_select,
            label: "Float (select)",
            placeholder: "Select your favourite number",
            option: [["1.1", "1.1"], ["2.4", "2.4"], ["3.14159265359", "π"]]
        end

        radio_buttons :float_radio,
          label: "Float (radio)",
            option: [["1.1", "1.1"], ["2.4", "2.4"], ["3.14159265359", "π"]]
      end

      section :bool do
        check_box :bool_default,
          label: "Bool (default)",
          question_text: "Do you like me?"
      end
    end
  end.new
end
