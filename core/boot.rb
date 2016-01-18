require_relative "formalist_demo/container"

FormalistDemo::Container.finalize! do |container|
  require "logger"
  container.register(:logger, Logger.new(container.root.join("log/app.log")))

  require "rodakase/call_sheet_composer"
  container.register(:transaction, Rodakase::CallSheetComposer.new(container))
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/core/boot" }

require_relative "formalist_demo/application"
