class HomeController < ApplicationController

  def show
    last_year = 2013
    @heroes = Hero.where(:year => last_year)
    @past_heroes = Hero.where(Hero.arel_table[:year].not_eq(last_year)).group_by(&:year)
  end

end
