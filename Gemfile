# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: '.ruby-version'

gem 'bootsnap', require: false
gem 'good_migrations'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.1'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'vite_rails', '~> 3.0'

# Authentication/Authorization

# Database
gem 'acts_as_list'
gem 'acts_as_tree'
gem 'attribute-defaults'
gem 'audited'
gem 'discard'
gem 'geocoder'
gem 'groupdate'
gem 'hairtrigger'
gem 'jsonb_accessor'
gem 'kaminari'
gem 'pg_search'

# Services
gem 'redis'
gem 'sidekiq'

# Utilities
gem 'indefinite_article'
gem 'more_possessive'
gem 'nokogiri'
gem 'retriable'

# Fixes
# warning: hairtrigger loaded ostruct from the standard library, but will no longer be part of the
# default gems starting from Ruby 3.5.0.
gem 'ostruct'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv', '>= 3.0'
  gem 'factory_bot_rails'
  gem 'i18n-tasks'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'bundler-audit', require: false
  gem 'erb_lint', require: false
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '>= 2.22.0', require: false
  gem 'web-console'

  # imported from WS
  gem 'better_errors'
  gem 'rubocop-i18n', require: false
  gem 'rubocop-rspec', require: false
  gem 'ruby-lsp'
  gem 'syntax_tree'
  gem 'syntax_tree-rbs'
end

group :test do
  gem 'capybara', require: false
  gem 'selenium-webdriver', require: false
  gem 'shoulda-matchers'

  # imported from WS
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'rails-controller-testing'
  gem 'shoulda-callback-matchers'
  gem 'simplecov', require: false
  gem 'test-prof'
end

# group :production do
#   gem 'sidekiq', '~> 7.0'
# end
