class NomineesController < ApplicationController

  def index
    @nominees = Nominee.begins_with(params[:q]).limit(10)
    render :index, :layout => false
  end

end
