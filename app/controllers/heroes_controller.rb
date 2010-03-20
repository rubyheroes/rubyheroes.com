class HeroesController < ApplicationController
  before_filter :authenticate
  def index
    @heroes = Hero.all
  end
  
  def show
    @hero = Hero.find(params[:id])
  end
  
  def new
    @hero = Hero.new
  end
  
  def create
    @hero = Hero.new(params[:hero])
    if @hero.save
      flash[:notice] = "Successfully created hero."
      redirect_to @hero
    else
      render :action => 'new'
    end
  end
  
  def edit
    @hero = Hero.find(params[:id])
  end
  
  def update
    @hero = Hero.find(params[:id])
    if @hero.update_attributes(params[:hero])
      flash[:notice] = "Successfully updated hero."
      redirect_to @hero
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy
    flash[:notice] = "Successfully destroyed hero."
    redirect_to heroes_url
  end
end
