# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

Rake::Task[:default].prerequisites.clear if Rake::Task.task_defined?(:default)

desc 'Run all checks'
task default: %w[spec erblint eslint stylelint rubocop] do
  puts '>>>>>> [OK] All checks passed!'
end

desc 'Apply auto-corrections'
task fix: %w[erblint:autocorrect eslint:autocorrect stylelint:autocorrect rubocop:autocorrect_all] do
  puts '>>>>>> [OK] All fixes applied!'
end
