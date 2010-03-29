class NominationsController < ApplicationController
  def new
    @nomination = Nomination.new
    @nomination.nominator = current_nominator
    if params[:site_id]
      @nomination.site = Site.find(params[:site_id])
    elsif params[:site]
      @nomination.site = Site.find_or_create_by_url(:url => params[:site][:url], :name => "New Unnamed Site")
    else
      redirect_to root_path and return
    end
  end

  def create
    @nomination = Nomination.new
    @nomination.site = Site.find_or_create_by_id(params[:nomination][:site_attributes][:id])
    @nomination.site = Site.find_or_create_by_url(params[:nomination][:site_attributes][:url]) if @nomination.site.new_record?
    @nomination.nominator = current_nominator
      # for some reason Nominator.find_or_create_by_email isn't working properly.
    @nomination.update_attributes(params[:nomination])
    if @nomination.save
      cookies[:nid] = @nomination.nominator_id
      session[:ns] = true
      flash[:notice] = "Thank you for your nomination."
      redirect_to @nomination
    else
      render :action => 'new'
    end
  end
  
  private
    # Just a simple precaution to keep users from
    #  passing around urls like /sites/22/nominations/new
    #  Possibly unneeded, but it sounds good.
    def session_check
      redirect_to search_sites_path unless session[:real_visit] && !session[:ns]
    end
    
    def current_nominator
      return @current_nominator if defined?(@current_nominator)
      return @current_nominator = Nominator.find(cookies[:nid]) if cookies[:nid]
      @current_nominator = Nominator.new
    end
end
