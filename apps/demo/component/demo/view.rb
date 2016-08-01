require "slim"
require "dry-view"
require "formalist_demo/assets"
require "demo/container"
require "demo/page"

module Demo
  Container.register "page", Page.new(assets: FormalistDemo::Assets.new)

  class View < Dry::View::Layout
    setting :root, Container.root.join("web/templates")
    setting :scope, Container["page"]
    setting :formats, {html: :slim}
    setting :name, "application"

    def locals(options)
      super.merge(options[:scope].view_locals)
    end
  end
end
