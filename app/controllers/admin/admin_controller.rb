module Admin
  class AdminController < ::ApplicationController

    before_filter :authenticate

    protected
      def authenticate
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == 'voter' && password == 'h3r03s'
        end
      end
  end
end
