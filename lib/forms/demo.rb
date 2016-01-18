require "formalist"

module Forms
  class Demo < Formalist::Form
    field :title, type: "string"
  end
end
