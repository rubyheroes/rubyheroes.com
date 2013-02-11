class HomeController < ApplicationController

  def show
    @heroes = Hero.where(:year => '2012')
    @past_heroes = Hero.where('year IS NOT 2012')
  end

end
