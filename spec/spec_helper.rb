require "bundler/setup"
require "pry"

unless ENV['TRAVIS']
  require 'simplecov'

  SimpleCov.start
end

require "paperclip/style_map"

require "support/database"
require "support/factory_girl"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
