# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  before_filter :authenticate

  # render new.rhtml
  def new
  end

  def create
    logger.info "passcode = #{params[:passcode]}"
    if params[:passcode] == "rubyheroes2008"
      self.current_user = User.find(:first)
      logger.info "Got in"
      successful_login
    else
      failed_login result.message
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/login')
  end

  private

  def successful_login
    redirect_to('/nominations')
  end

  def failed_login(message)
    flash[:error] = message
    redirect_to(new_session_url)
  end

end