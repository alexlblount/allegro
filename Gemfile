# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: '.ruby-version'

# Recommended by Evil Martians
# https://evilmartians.com/chronicles/gemfile-of-dreams-libraries-we-use-to-build-rails-apps

# Rails Fundamentals
gem 'bootsnap', require: false
gem 'pg', '~> 1.5'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.2'

# Background Jobs
gem 'redis'
gem 'sidekiq'
# if not using sidekiq enterprise
# gem 'sidekiq-grouping'
# gem 'sidekiq-limit_fetch'

# Active Record Extensions
gem 'acts_as_list'
gem 'acts_as_tree'
gem 'ar_lazy_preload'
gem 'attribute-defaults'
gem 'audited'
gem 'discard'
gem 'geocoder'
gem 'groupdate'
gem 'kaminari'
gem 'pg_search'
gem 'pg_trunk'
gem 'postgresql_cursor'
gem 'store_attribute'
gem 'store_model'

# Authentication
gem 'devise'
# gem 'devise-pwned_password' # requires config: https://github.com/michaelbanfield/devise-pwned_password
# gem 'devise-security' # requires config: https://github.com/devise-security/devise-security
gem 'pretender'

# Authorization
gem 'action_policy'

# HTML Views
gem 'jbuilder'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'view_component'
gem 'view_component-contrib'

# Asset Management
# gem 'imgproxy-rails'
# gem 'premailer-rails'
gem 'vite_rails', '~> 3.0'

# Crafting JSON APIs
gem 'alba'
gem 'oj'

# GraphQL
gem 'graphql', '~> 2.3'
# Cursor-based pagination for connections
gem 'graphql-connections'
# Caching for GraphQL done right
gem 'graphql-fragment_cache'
# Support for Apollo persisted queries
gem 'graphql-persisted_queries'
# Authorization for GraphQL
gem 'action_policy-graphql'
gem 'graphiql-rails', group: :development
gem 'graphql-schema_comparator', group: :development

# Other Utilities
gem 'anycable-rails'
gem 'anyway_config'
gem 'dry-effects'
gem 'dry-initializer'
gem 'dry-monads'
# gem 'feature_toggles'
gem 'nanoid'
gem 'nokogiri'
# gem 'redlock'
gem 'retriable'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Logging Utilities
gem 'silencer', require: ['silencer/rails/logger']

group :development, :test do
  # Security Analysis
  gem 'brakeman', require: false

  # Debugging Tools
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Environment Variables
  gem 'dotenv', '>= 3.0'

  # Internationalization
  gem 'i18n-tasks'

  # Testing Framework
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do # rubocop:disable Metrics/BlockLength
  # Documentation and Annotation
  gem 'annotate'

  # Better Error Handling
  gem 'better_errors'
  gem 'web-console'

  # N+1 Queries and Bulletproofing
  gem 'bullet'

  # Security Auditing
  gem 'bundler-audit', require: false

  # Code Linters
  gem 'erb_lint', require: false
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-graphql', require: false
  gem 'rubocop-i18n', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '>= 2.22.0', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false

  # Language Server Protocol and Syntax Tools
  gem 'syntax_tree'
  gem 'syntax_tree-rbs'

  # Mailer Preview in Browser
  gem 'letter_opener'

  # Component Preview Tool
  gem 'lookbook', require: false

  # Database Tools
  gem 'database_consistency'
  gem 'database_validations'
  gem 'evil-seed'
  gem 'good_migrations'
  gem 'rails-pg-extras'
  gem 'strong_migrations'

  # Code Isolation and Detection
  gem 'isolator'

  # Profiling and Benchmarking
  gem 'derailed_benchmarks'
  gem 'rack-mini-profiler'
  gem 'stackprof'
  gem 'vernier'

  # Automation Tool for Code Review
  gem 'danger', require: false
end

group :test do
  # Code Coverage
  gem 'simplecov', require: false

  # Integration Testing
  gem 'capybara', require: false
  # gem 'capybara-thruster'
  gem 'selenium-webdriver', require: false # replace with cuprite for headless testing?

  # Testing Tools
  # gem 'cuprite'
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'fuubar', require: false
  gem 'n_plus_one_control'
  gem 'rails-controller-testing'
  gem 'rspec-instafail', require: false
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
  # gem 'site_prism'
  gem 'test-prof'
  # gem 'vcr'
  gem 'webmock'
  gem 'with_model'
  # gem 'zonebie'
end

group :production do
  # gem 'sidekiq', '~> 7.0'

  # Logging and Instrumentation (see Evil Martians link for details)
  # gem 'lograge'
  # gem 'yabeda-puma-plugin', require: false
  # gem 'yabeda-sidekiq', require: false
end
