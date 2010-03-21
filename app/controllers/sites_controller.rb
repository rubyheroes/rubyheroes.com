class SitesController < ApplicationController
  
  def search
    if request.xhr? && params[:site_url] && params[:site_url].length > 2
      @sites = Site.all(:conditions=>['url LIKE ?', params[:site_url]+'%'], :limit=>10)
      render :action => "search_xhr", :layout => false
    else
      @sites = []
    end
  end

end
