class NomineesController < ApplicationController
  def index
    @nominees = Nominee.begins_with(params[:q]).limit(3)
    if @nominees.any?
      render :index, layout: false
    else
      render nothing: true
    end
  end
end
