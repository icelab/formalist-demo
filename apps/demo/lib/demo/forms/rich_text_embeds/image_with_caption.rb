module Demo
  module Forms
    module RichTextEmbeds
      class ImageWithCaption < Formalist::Form
        define do
          text_field :image_id,
            label: "Image ID",
            placeholder: 1234

          text_field :caption,
            label: "Caption",
            placeholder: "Caption",
            hint: "Image caption",
            validation: {filled: true}
        end
      end
    end
  end
end
