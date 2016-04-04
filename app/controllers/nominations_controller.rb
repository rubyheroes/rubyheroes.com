class NominationsController < ApplicationController
  def new
    redirect_to root_path unless VotingEnabled?

    @nomination = Nomination.new.tap do |n|
      n.nominator = current_nominator
      n.nominee_id = params[:nominee_id]
      n.build_nominee(github_username: params[:nominee]) if n.nominee.blank?
    end
  end

  def create
    @nomination = Nomination.new(nomination_params)
    if @nomination.save
      session[:nominator_id] = @nomination.nominator_id
      session[:ns] = true
      flash[:notice] = "Thank you for your nomination."
      redirect_to @nomination
    else
      render :new
    end
  end

  def show
    if @nomination = Nomination.find_by(id: params[:id])
      render :show
    else
      redirect_to new_nomination_path
    end
  end

  private

  def nomination_params
    params.require(:nomination).permit(
      :testimonial,
      nominee_attributes: [:github_username],
      nominator_attributes: [:id, :name, :email]
    )
  end

  def current_nominator
    @current_nominator ||= begin
      if cookies[:nominator_id]
        Nominator.find(session[:nominator_id])
      else
        Nominator.new
      end
    rescue
      # if the database is reset the nominator record would have been deleted.
      session[:nominator_id] = nil
      Nominator.new
    end
  end
end
