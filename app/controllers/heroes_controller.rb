class HeroesController < ApplicationController
  def year
    @year = params[:year]
    @heroes = Hero.where(year: @year)

    respond_to do |format|
      format.html { render root_path(anchor: "heroes", year: @year) }
      format.json { render json: @heroes.to_json(only: [:name, :url, :year]) }
    end
  end

  def index
    respond_to do |format|
      format.html { redirect_to root_path(anchor: "heroes") }
      format.json do
        render json: Hero.select(:name, :url, :year).to_json(only: [:name, :url, :year])
      end
    end
  end
end
