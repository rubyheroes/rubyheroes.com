# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'voter' && password == 'h3r03s'
    end
  end
  

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'eee6fa91b3sdfdsf4a2b8cda8367aaae4026c3'
end
