# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.1.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "bootsnap", ">= 1.4.4", require: false
gem "active_model_serializers"
gem "httparty"
gem "sidekiq"
gem "sidekiq-cron", "~> 1.1"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-shopify", require: false
end

group :development do
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "rspec-rails"
  gem "database_cleaner"
  gem "factory_bot_rails", require: false
  gem "faker"
  gem "json-schema"
  gem "webmock"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
