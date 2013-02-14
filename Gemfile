source 'http://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.0.20'

gem "haml-rails", "~> 0.3.4"
gem "rdiscount", "~> 2.0.7"
gem "formtastic", "~> 2.2.1"
gem "kaminari", "~> 0.14.1"
gem 'sass', '~> 3.2.5'
gem "jquery-rails", "~> 2.2.1"
gem 'newrelic_rpm'
gem "google-analytics-rails", "~> 0.0.3"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails', "~> 2.12.2"
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
end
