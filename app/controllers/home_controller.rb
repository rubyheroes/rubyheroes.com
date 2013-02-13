class HomeController < ApplicationController

  def show
    @heroes = Hero.where(:year => '2012')
    @past_heroes = Hero.where(Hero.arel_table[:year].not_eq("2012"))
  end

end
