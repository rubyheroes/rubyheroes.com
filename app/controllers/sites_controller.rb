class SitesController < ApplicationController
  
  def search
    if params[:site_url] && params[:site_url].length > 2
      @sites = Sites.all(:conditions["url LIKE '?%'",params[:site_url]])
    else
      @sites = []
    end
  end

end
