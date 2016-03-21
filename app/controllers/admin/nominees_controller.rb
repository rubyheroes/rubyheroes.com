class Admin::NomineesController < Admin::AdminController

  def index
    current_year = Date.today.year

    @nomination_count = Nomination.from_year(current_year).count
    @voter_count = Nominator.from_year(current_year).count
    @nominee_count = Nominee.from_year(current_year).count
    @nominees = Nominee.ordered_by_recent_nominations.page(params[:page])
  end

  def show
    @nominee = Nominee.find_by(github_username: params[:id])
    @recent_nominations = @nominee.recent_nominations.order(created_at: :desc)
    @nominations = @nominee.nominations.order(created_at: :desc)
  end

end
