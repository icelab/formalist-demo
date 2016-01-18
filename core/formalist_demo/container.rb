require "rodakase/container"

module FormalistDemo
  class Container < Rodakase::Container
    configure do
      load_paths! "lib", "core"
    end
  end
end
