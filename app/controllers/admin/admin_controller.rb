module Admin
  class AdminController < ::ApplicationController
    layout "admin"

    before_action :authenticate

    protected
      def authenticate
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == 'voter' && password == 'h3r03s'
        end
      end
  end
end
