class NominationsController < ApplicationController
  def new
    @nomination = Nomination.new
    @nomination.nominator = current_nominator
    @nomination.nominee_id = params[:nominee_id]
    @nomination.build_nominee(:github_username => params[:nominee]) unless @nomination.nominee
    @nomination.nominee.valid?
  end

  def create
    @nomination = Nomination.new(nomination_params)
    if @nomination.save && @nomination.nominee.valid?
      session[:nominator_id] = @nomination.nominator_id
      session[:ns] = true
      flash[:notice] = "Thank you for your nomination."
      redirect_to @nomination
    else
      @nomination.nominee.valid?
      render :action => 'new'
    end
  end

  private

  def nomination_params
    params.require(:nomination).permit(:testimonial, nominee_attributes: [:github_username], nominator_attributes: [:name, :email])
  end

  # Just a simple precaution to keep users from
  #  passing around urls like /sites/22/nominations/new
  #  Possibly unneeded, but it sounds good.
  def session_check
    #redirect_to search_sites_path unless session[:real_visit] && !session[:ns]
  end

  def current_nominator
    @current_nominator ||= cookies[:nominator_id] ?  Nominator.find(session[:nominator_id]) : Nominator.new
  rescue
    # just in case the database was reset, their nominator record would have been deleted.
    session[:nominator_id] = nil
    @current_nominator = Nominator.new
  end
end
