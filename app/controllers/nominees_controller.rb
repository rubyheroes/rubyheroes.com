class NomineesController < ApplicationController

  def index
    @nominees = Nominee.begins_with(params[:q]).limit(10)
    if @nominees.any?
      render :index, :layout => false
    else
      render :nothing => true
    end
  end

  def index
    @sites = Site.paginate(:order=>"nominations_count DESC", :page => params[:page])
    render :index, :layout => 'admin'
  end
  
  def show
    @site = Site.find(params[:id])
    render :show, :layout => 'admin'
  end

end
