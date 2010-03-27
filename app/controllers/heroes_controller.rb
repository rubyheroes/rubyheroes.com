class HeroesController < ApplicationController
  
  def year
    @year = params[:year]
    @heroes = Hero.find_all_by_year(@year)
    
    if request.xhr?
      render :action => "xhr/year", :layout => false and return
    end
    
    render :file => "#{RAILS_ROOT}/public/404.html", :status => 404 if @heroes.empty?
  end
end
