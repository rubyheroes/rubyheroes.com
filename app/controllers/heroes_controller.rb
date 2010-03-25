class HeroesController < ApplicationController
  def year
    #TODO: Make this more robust, really simplified right now.
    @year = params[:year]
    @heroes = Hero.find_all_by_year(@year)
    render :action =>"xhr/year", :layout => false
  end
end
