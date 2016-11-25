class Demo::Application
  route "search" do |r|
    r.get do
      page = (r.params["page"] || 1).to_i
      per_page = (r.params["per_page"] || 20).to_i

      # Return "real" data for existing values
      range = if r.params["ids"]
        r.params["ids"].map(&:to_i)
      else
        (1..per_page)
      end

      # Fake a no result if "noresult" is passed
      if r.params["q"] === "noresult"
        response = {
          results: [],
          pagination: {}
        }
      else
        results = range.map {|i|
          id = i + ((page - 1) * per_page)
          {
            id: id,
            label: "Option #{id} for #{r.params["q"] || 'no-query'}"
          }
        }

        response = {
          results: results,
          pagination: {
            page: page,
            per_page: per_page,
            total_pages: 10,
            total_results: 195,
          }
        }
      end
      response
    end
  end
end
