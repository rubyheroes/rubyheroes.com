class HeroesController < ApplicationController
  
  def year
    @year = params[:year]
    @heroes = Hero.find_all_by_year(@year)
    
    response.headers['Cache-Control'] = 'public, max-age=43200'
    respond_to do |format|
      format.html do
        render :file => "#{RAILS_ROOT}/public/404.html", :status => 404 if @heroes.empty?
      end
      format.json { render :json => @heroes.to_json(:only => [:name, :url, :year]) }
    end
    
  end
  
  def index
    @heroes = Hero.all
    response.headers['Cache-Control'] = 'public, max-age=300'
    respond_to do |format|
      format.html do
        render :file => "#{RAILS_ROOT}/public/404.html", :status => 404 if @heroes.empty?
      end
      format.json { render :json => @heroes.to_json(:only => [:name, :url, :year]) }
    end
  end
end
