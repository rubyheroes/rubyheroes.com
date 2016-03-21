class Admin::NominatorsController < Admin::AdminController
  def index
    @nominators = Nominator.order(created_at: :desc).page(params[:page])
  end

  def show
    @nominator = Nominator.find(params[:id])
  end

end
