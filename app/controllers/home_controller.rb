class HomeController < ApplicationController

  def show
    @this_year = "2015"
    last_year = "2015"
    @heroes = Hero.where(:year => last_year)
    @past_heroes = Hero.where("year != ?", last_year).
      group_by(&:year).
      sort.reverse!
  end

end
