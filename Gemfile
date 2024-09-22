source "https://rubygems.org"

ruby file: ".ruby-version"

gem "good_migrations"
gem "vite_rails", "~> 3.0"
gem "rails", "~> 7.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "factory_bot_rails"
  gem "dotenv", ">= 3.0"
  gem "rspec-rails"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "letter_opener"
  gem "erb_lint", require: false
  gem "bundler-audit", require: false
  gem "annotate"
  gem "web-console"
end

group :test do
  gem "shoulda-matchers"
  gem "selenium-webdriver", require: false
  gem "capybara", require: false
end

group :production do
  gem "sidekiq", "~> 7.0"
end
