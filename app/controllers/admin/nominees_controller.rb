class Admin::NomineesController < Admin::AdminController

  def index
    @nomination_count = Nomination.count
    @voter_count = Nominator.count
    @nominee_count = Nominee.count
    @nominees = Nominee.order(nomination_count: :desc).page(params[:page])
  end

  def show
    @nominee = Nominee.find_by(github_username: params[:id])
  end

end
