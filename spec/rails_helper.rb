# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "webmock/rspec"
require "factory_bot"

Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }
FactoryBot.find_definitions

ActiveRecord::Migration.maintain_test_schema!

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include(FactoryBot::Syntax::Methods)

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!

  config.include(ControllerHelpers, type: :controller)
end
