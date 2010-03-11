# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'voter' && password == 'h3r03s'
    end
  end
  
  protect_from_forgery
end
