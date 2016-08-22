require "formalist"
require "formalist/elements/standard"
require "demo/import"

module Demo
  class Form < Formalist::Form
    include Demo::Import[image_with_caption_form: "forms.rich_text_embeds.image_with_caption"]

    define do
      rich_text_area :content,
        label: "Rich text area",
        inline_formatters: %w[bold underline],
        block_formatters: %w[unstyled header-one header-two unordered-list-item ordered-list-item blockquote pullquote code],
        embeddable_forms: dep(:embeddable_forms)

      text_field :text_field,
        label: "Text field",
        placeholder: "Text field placeholder",
        hint: "Text field hint",
        validation: {
          filled: true,
          format: "/leftpad/"
        }

      number_field :number_field,
        label: "Number field",
        placeholder: "Number field placeholder",
        step: 0.5,
        min: 10,
        max: 20,
        validation: {
          filled: true,
          num: true,
          gteq: 10,
          lteq: 20
        }

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

      selection_field :selection_field,
        label: "Selection field",
        options: [{
          id: 1,
          label: "Option 1"
        }, {
          id: 2,
          label: "Option 2"
        }]

      multi_selection_field :multi_selection_field,
        label: "Multi selection field",
        options: [{
          id: 1,
          label: "Option 1"
        }, {
          id: 2,
          label: "Option 2"
        }, {
          id: 3,
          label: "Option 3"
        }],
        validation: {
          min_size: 1,
          max_size: 2,
        }

      section :section, label: "Section label" do
        text_field :section_text_field,
          label: "Section text field"
        number_field :section_number_field,
          label: "Section number field"
      end

      group :group, label: "Group label" do
        text_field :group_text_field,
          label: "Group text field",
          validation: {
            filled: true
          }
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

    def embeddable_forms
      {
        image_with_caption: {
          label: "Image with caption",
          form: image_with_caption_form
        }
      }
    end
  end
end
