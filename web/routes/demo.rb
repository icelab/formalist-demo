require "formalist/output_compiler"
require "json"

module FormalistDemo
  class Application < Rodakase::Application
    route "demo" do |r|
      r.get do
        r.is to: "views.demo"
      end

      r.post do
        r.resolve "operations.submit_demo" do |submit_demo|
          # TODO: Make this nicer
          input = Formalist::OutputCompiler.new.call(JSON.parse(r[:data]))

          submit_demo.(input).match do |m|
            m.success do
              r.redirect "/demo"
            end

            m.failure do |error_form|
              r.resolve "views.demo" do |view|
                view.(form: error_form)
              end
            end
          end
        end
      end
    end
  end
end
