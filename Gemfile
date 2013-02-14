source 'http://rubygems.org'

ruby "1.9.3"

gem 'rails', '~> 3.1'

gem "haml-rails"
gem "rdiscount", "~> 2.0.7"
gem "formtastic", "~> 2.2.1"
gem "kaminari", "~> 0.14.1"
gem 'sass', '~> 3.2.5'
gem "jquery-rails", "~> 2.2.1"
gem 'newrelic_rpm'
gem "google-analytics-rails", "~> 0.0.3"
gem 'hirefireapp'

group :assets do
  gem 'sass-rails', "~> 3.2.6"
  gem 'coffee-rails', "~> 3.2.2"
  gem 'uglifier', '~> 1.3.0'
end

group :production do
  gem 'pg', "~> 0.14.1"
end

group :development, :test do
  gem 'rspec-rails', "~> 2.12.2"
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'factory_girl_rails', "~> 4.2.1"
  gem 'sqlite3', "~> 1.3.7"
end

group :test do
  gem 'shoulda-matchers', "~> 1.4.2"
  gem 'capybara', "~> 2.0.2"
end
