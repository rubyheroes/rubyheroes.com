class HomeController < ApplicationController

  def show
    @heroes = Hero.where(:year => '2011')
  end

end
