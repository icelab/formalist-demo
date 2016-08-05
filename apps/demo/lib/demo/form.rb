require "formalist"
require "formalist/elements/standard"

module Demo
  class Form < Formalist::Form
    define do
      search_selection_field :search_selection_field,
        label: "Search selection field",
        search_url: "/search",
        search_params: {
          file_type: :image
        },
        search_per_page: 20,
        search_threshold: 1

      search_multi_selection_field :search_multi_selection_field,
        label: "Search multi selection field",
        search_url: "/search",
        search_params: {
          file_type: :image
        },
        search_per_page: 20,
        search_threshold: 1
    end
  end
end
