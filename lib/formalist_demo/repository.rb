require "rom-repository"
require "formalist_demo/container"
require "formalist_demo/import"

FormalistDemo::Container.boot! :rom

module FormalistDemo
  class Repository < ROM::Repository::Root
    include FormalistDemo::Import.args["persistence.rom"]
  end
end
