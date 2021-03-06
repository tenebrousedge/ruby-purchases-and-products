ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'rubysales'
require 'timecop'
require 'pry-byebug'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:each) do
    Rubysales::Product.all.each(&:destroy)
    Rubysales::Purchase.all.each(&:destroy)
  end
end
