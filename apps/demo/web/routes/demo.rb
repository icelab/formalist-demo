class Demo::Application
  route "form" do |r|
    r.get do
      r.view "form.show"
    end

    r.post do
      r.resolve "demo.operations.submit_form" do |submit_form|
        submit_form.(r[:data]).match do |m|
          m.success do
            r.redirect "/form"
          end

          m.failure do |result|
            r.view "form.show", result: result
          end
        end
      end
    end
  end
end
