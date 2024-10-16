# frozen_string_literal: true

AnyCable.configure do |config|
  config.redis_url = ENV.fetch('REDIS_URL', 'redis://localhost:6379/1')
end
