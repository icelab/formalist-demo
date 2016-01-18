module FormalistDemo
  class Application < Rodakase::Application
    route "demo" do |r|
      r.is to: "views.demo"
    end
  end
end
