require "formalist"

module Forms
  class Demo < Formalist::Form
    section :main do |section|
      section.field :name, type: "string", label: "Name"
      section.field :title, type: "string", display: "select", label: "Title", hint: "Nudge, nudge, wink, wink", option_values: ["Lord", "Lady", "Wing Commander"]
      section.field :age, type: "string", display: "select", label: "age", hint: "Nudge, nudge, wink, wink", option_values: ["0-10", "10-50", "50-51"]
    end
    section :meta do |section|
      section.field :published, type: "bool", question_text: "Publish this person?"
    end
  end
end
