# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Allegro
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('app', 'frontend', 'components')
    config.view_component.preview_paths << Rails.root.join('app', 'frontend', 'components')

    config.active_record.query_log_tags_enabled = true
    config.active_record.query_log_tags = [
      # Rails query log tags:
      :application,
      :controller,
      :action,
      :job,
      # GraphQL-Ruby query log tags:
      {
        current_graphql_operation: -> { GraphQL::Current.operation_name },
        current_graphql_field: -> { GraphQL::Current.field&.path },
        current_dataloader_source: -> { GraphQL::Current.dataloader_source_class }
      }
    ]
    # Prevents Rails from trying to eager-load the contents of app/frontend
    config.javascript_path = 'frontend'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets generators tasks templates])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'America/Chicago'
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Use Sidekiq for ActiveJob
    config.active_job.queue_adapter = :sidekiq

    # graphql-ruby-fragment_cache
    # arguments and options are the same as for `config.cache_store`
    config.graphql_fragment_cache.store = :redis_cache_store
  end
end
