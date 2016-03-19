class HomeController < ApplicationController
  def show
    @years = Hero.order(year: :desc).order(:name).group_by(&:year) # where(year: last_year)
    @this_year = Date.today.year
  end

  def selected_year
    if params[:year].present?
      params[:year]
    else
      # defaults to the most recent year for which heroes have been named
      @years.first.first
    end
  end
  helper_method :selected_year
end
