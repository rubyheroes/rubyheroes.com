module Admin
  class AdminController < ::ApplicationController
    layout "admin"

    before_action :authenticate, unless: -> { Rails.env.development? }

    protected
      def authenticate
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
        end
      end
  end
end
