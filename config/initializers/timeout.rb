# Since Heroku has a 30 second timeout and Puma has not timeout
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout
Rack::Timeout.timeout = 20 if defined? Rack::Timeout # seconds
