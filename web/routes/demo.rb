require "json"

module FormalistDemo
  class Application < Rodakase::Application
    route "demo" do |r|
      r.get do
        r.is to: "views.demo"
      end

      r.post do
        r.resolve "operations.submit_demo" do |submit_demo|
          submit_demo.(r[:data]).match do |m|
            m.success do
              r.redirect "/demo"
            end

            m.failure do |result|
              r.resolve "views.demo" do |view|
                view.(result: result)
              end
            end
          end
        end
      end
    end
  end
end
