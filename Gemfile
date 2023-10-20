source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 7.0.7"
gem "sprockets-rails"
gem 'sidekiq'
gem "sidekiq-cron"
gem 'pg'
gem 'pg_search'
gem 'redis'
gem "pundit"
gem 'bootstrap', '~> 5.0'
gem "puma", "~> 5.0"
gem "importmap-rails"
gem 'faker'
gem 'stripe'
gem "turbo-rails"
gem 'ransack'
gem 'sass-rails'
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise" 

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
