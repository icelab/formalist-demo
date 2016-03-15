require "formalist"
require "formalist/elements/standard"
require "validation/demo_schema"

module Forms
  DemoForm = Class.new(Formalist::Form) do
    define do
      text_field :text_field,
        label: "Text field",
        placeholder: "Text field placeholder",
        hint: "Text field hint"

      number_field :number_field,
        label: "Number field",
        placeholder: "Number field placeholder",
        step: 0.5,
        min: 10,
        max: 20

      check_box :check_box,
        label: "Checkbox",
        question_text: "Checkbox question?"

      select_box :select_box,
        label: "Select box",
        options: [["1", "One"], ["2", "Two"], ["3", "Three"]]

      radio_buttons :radio_buttons,
        label: "Radio buttons",
        options: [["1", "One"], ["2", "Two"], ["3", "Three"]]

      text_area :text_area,
        label: "Text area",
        placeholder: "Text area placeholder"

      date_field :date_field,
        label: "Date field"

      date_time_field :date_time_field,
        label: "Date-time field"

      section :section, label: "Section label" do
        text_field :section_text_field,
          label: "Section text field"
        number_field :section_number_field,
          label: "Section number field"
      end

      group :group, label: "Group label" do
        text_field :group_text_field,
          label: "Group text field"
        number_field :group_number_field,
          label: "Group number field"
      end

      many :many do
        text_field :many_text_field,
          label: "Many text field"
        date_field :many_date_field,
          label: "Many date field"
      end

      attr :attr do
        text_field :attr_text_field,
          label: "Attr text field"
        date_field :attr_date_field,
          label: "Attr date field"
      end

      compound_field do
        text_field :compound_field_text_field,
          label: "Compound text field"
        date_field :compound_field_date_field,
          label: "Compound date field"
      end
    end
  end.new
end
