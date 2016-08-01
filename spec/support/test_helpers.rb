module TestHelpers
  module_function

  def app
    FormalistDemo::Application.app
  end

  def rom
    FormalistDemo::Container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
