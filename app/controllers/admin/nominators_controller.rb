class Admin::NominatorsController < Admin::AdminController
  def index
    @nominators = Nominator.order('created_at DESC').page(params[:page])
  end

  def show
    @nominator = Nominator.find(params[:id])
  end

end
