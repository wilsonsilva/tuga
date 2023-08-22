require 'bundler/setup'
require 'pry'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::Console unless ENV['COVERAGE_FORMAT'] == 'html'

unless ENV['COVERAGE'] == 'false'
  SimpleCov.start do
    root 'lib'
    coverage_dir "#{Dir.pwd}/coverage"
  end
end

require 'tuga'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  include Matchers
end
