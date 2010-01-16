class PanelsController < ApplicationController
  before_filter :authenticate

  def show
    @users = User.search :skip_pagination => true
  end
end
