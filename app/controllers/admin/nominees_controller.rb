class Admin::NomineesController < Admin::AdminController

  def index
    current_year = Date.today.year

    @nomination_count = Nomination.from_year(current_year).count
    @voter_count = Nominator.from_year(current_year).count
    @nominee_count = Nominee.from_year(current_year).count
    @nominees = Nominee.from_year(current_year).
      order(nomination_count: :desc).page(params[:page])
  end

  def show
    @nominee = Nominee.find_by(github_username: params[:id])
  end

end
