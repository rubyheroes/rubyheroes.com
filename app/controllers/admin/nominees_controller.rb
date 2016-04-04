class Admin::NomineesController < Admin::AdminController

  def index
    current_year = Date.today.year

    @nomination_count = Nomination.from_year(current_year).count
    @voter_count = Nominator.from_year(current_year).count
    @nominee_count = Nominee.from_year(current_year).count
    @nominees = Nominee.ordered_by_recent_nominations.page(params[:page])
  end

  def show
    @nominee = Nominee.find(params[:id])
    @recent_nominations = @nominee.recent_nominations.order(created_at: :desc)
    @nominations = @nominee.nominations.order(created_at: :desc)
  end

  def merge
    @nominee = Nominee.find(params[:nominee_id])
    @target_nominee = Nominee.find(params[:target_nominee_id])

    if @target_nominee && @nominee.merge_into(@target_nominee)
      flash[:notice] = "Successfully merged #{@nominee} into #{@target_nominee}."
      redirect_to admin_nominee_path(@target_nominee.id)
    else
      flash[:notice] = "Failed to merge #{@nominee} into #{@target_nominee}."
      redirect_to admin_nominee_path(@nominee.id)
    end
  end

end
