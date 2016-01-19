require "formalist"

module Forms
  class Demo < Formalist::Form
    field :name, type: "string", label: "Name"
    field :title, type: "string", display: "select", label: "Title", hint: "Nudge, nudge, wink, wink", option_values: ["Lord", "Lady", "Wing Commander"]
    field :published, type: "bool", question_text: "Publish this person?"
  end
end
