source "http://rubygems.org"

ruby "2.3.0"

gem "rails", "~> 4.2.0"
gem "sass-rails"
gem "coffee-rails"
gem "uglifier"
gem "haml-rails"
gem "pg"
gem "simple_form"
gem "kaminari" # pagination
gem "jquery-rails"
gem "bugsnag"
gem "skylight"
gem "puma"

group :production do
  gem "rails_12factor"
  gem "rack-timeout"
end

group :development do
  gem 'web-console'
end

group :development, :test do
  gem "rspec-rails", "~> 3.4.2"
  gem "pry-rails"
  gem "pry-remote"
  gem "factory_girl_rails", "~> 4.6.0"
  gem "quiet_assets"
  gem "spring"
  gem "fuubar"
  gem "faker"
end

group :test do
  gem "capybara", "~> 2.6.2"
  gem "launchy"
end
