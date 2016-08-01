module FormalistDemo
  class Application < Roda
    route do |r|
      r.run Demo::Application.freeze.app
    end
  end
end
