class NominatorsController < ApplicationController
  def index
    @nominators = Nominator.all
  end
  
  def show
    @nominator = Nominator.find(params[:id])
  end
  
  def new
    @nominator = Nominator.new
  end
  
  def create
    @nominator = Nominator.new(params[:nominator])
    if @nominator.save
      flash[:notice] = "Successfully created nominator."
      redirect_to @nominator
    else
      render :action => 'new'
    end
  end
  
  def edit
    @nominator = Nominator.find(params[:id])
  end
  
  def update
    @nominator = Nominator.find(params[:id])
    if @nominator.update_attributes(params[:nominator])
      flash[:notice] = "Successfully updated nominator."
      redirect_to @nominator
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @nominator = Nominator.find(params[:id])
    @nominator.destroy
    flash[:notice] = "Successfully destroyed nominator."
    redirect_to nominators_url
  end
end
