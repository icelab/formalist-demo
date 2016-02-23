require "slim"
require "rodakase/view"

require "formalist_demo/container"
require "formalist_demo/page"

module FormalistDemo
  Container.register(:page, Page.new(Container.config))

  class View < Rodakase::View::Layout
    setting :root, Container.root.join("web/templates")
    setting :scope, Container[:page]
    setting :engine, :slim
    setting :name, "application"
  end
end
