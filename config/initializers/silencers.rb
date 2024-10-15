# config/initializers/silencer.rb
# frozen_string_literal: true

Rails.application.configure do
  config.middleware.swap(
    Rails::Rack::Logger,
    Silencer::Logger,
    config.log_tags,
    silence: ['/up']
  )
end
