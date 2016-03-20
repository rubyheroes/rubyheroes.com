class HeroesController < ApplicationController
  before_action :find_years

  def year
    @year = params[:year]
    @heroes = Hero.where(year: @year)

    respond_to do |format|
      format.html { render :year }
      format.json { render json: @heroes.to_json(only: [:name, :url, :year]) }
    end
  end

  def index
    respond_to do |format|
      format.html { redirect_to year_heroes_path(year: @years.last.first) }
      format.json do
        render json: Hero.select(:name, :url, :year).to_json(only: [:name, :url, :year])
      end
    end
  end

  private

  def find_years
    @years = Hero.order(year: :asc).order(:name).group_by(&:year).to_a
  end
end
