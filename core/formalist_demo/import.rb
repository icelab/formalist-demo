require_relative "container"

module FormalistDemo
  Import = FormalistDemo::Container.import_module

  def self.Import(*args)
    Import[*args]
  end
end
