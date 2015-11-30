class NominatorsController < ApplicationController
  def index
    @nominators = Nominator.all
  end

  def show
    @nominator = Nominator.find(params[:id])
  end

  private

  def nominator_params
    params.require(:nominator).permit(:email, :name)
  end
end
