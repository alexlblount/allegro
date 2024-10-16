# frozen_string_literal: true

GraphQL::FragmentCache::Cache.store = Redis.new(url: ENV['REDIS_URL'])

GraphQL::PersistedQueries.configure do |config|
  config.storage = :redis
  config.redis_client = Redis.new(url: ENV['REDIS_URL'])
end
