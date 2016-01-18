module TestHelpers
  module_function

  def container
    FormalistDemo::Container
  end

  def app
    FormalistDemo::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
