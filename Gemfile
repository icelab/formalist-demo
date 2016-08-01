source "https://rubygems.org"

gem "rake"

# Web framework
gem "rack", "~> 1.6"
gem "dry-web", ">= 0.4.0"
gem "dry-web-roda", ">= 0.3.0"
gem "puma"
gem "rack_csrf"
gem "shotgun"

# Application dependencies
gem "dry-matcher"
gem "dry-monads"
gem "dry-transaction"
gem "dry-types"
gem "dry-validation"
gem "dry-view"
gem "slim"

# Formalist
gem "formalist", git: "https://github.com/icelab/formalist", branch: "master"

group :development, :test do
  gem "pry-byebug"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "poltergeist"
  gem "rspec"
end
