class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == 'voter' && password == 'h3r03s'
      end
    end
end
