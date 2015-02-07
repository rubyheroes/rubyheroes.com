class SitesController < ApplicationController
  before_action :authenticate, :except => [:search]

  def search
    if request.xhr? && params[:site_url] && params[:site_url].length > 2
      @sites = Site.all(:conditions=>['url LIKE ?', params[:site_url]+'%'], :limit=>10)
      if @sites.empty?
        render :nothing => true
      else
        render :action => "search_xhr", :layout => false
      end
    else
      session[:real_visit] = true
      session[:ns] = false
      @sites = []
      @heroes = [Hero.find(:random),Hero.find(:random)]
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
