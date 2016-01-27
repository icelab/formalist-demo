source "https://rubygems.org"

ruby "2.3.0"

# Web framework
gem "puma"
gem "rodakase", git: "https://github.com/solnic/rodakase"
gem "dry-component", git: "https://github.com/dryrb/dry-component"
gem "shotgun"

# Application dependencies
gem "dry-data"
gem "dry-validation"
gem "either_result_matcher"
gem "formalist", git: "https://github.com/icelab/formalist"
gem "kleisli"
gem "slim"

group :development, :test do
  gem "byebug"
  gem "guard-rspec", require: false
  gem "pry-byebug"
end

group :test do
  gem "capybara", require: false
  gem "capybara-screenshot", require: false
  gem "database_cleaner"
  gem "inflecto"
  gem "rspec"
  gem "site_prism"
end
