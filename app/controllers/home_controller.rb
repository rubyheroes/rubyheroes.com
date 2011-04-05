class HomeController < ApplicationController

  def show
    @heroes = [Hero.find(:random), Hero.find(:random)]
  end

end
