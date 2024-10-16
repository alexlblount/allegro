# frozen_string_literal: true

# graphql-ruby-fragment_cache
# https://github.com/DmitryTsepelev/graphql-ruby-fragment_cache?tab=readme-ov-file#execution-errors-and-caching
GraphQL::FragmentCache.skip_cache_when_query_has_errors = true

# how to disable for test env:
# GraphQL::FragmentCache.enabled = false if Rails.env.test?
