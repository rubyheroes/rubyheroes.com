module Admin
  class NomineesController < AdminController

    def index
      @nomination_count = Nomination.count
      @voter_count = Nominator.count
      @nominee_count = Nominee.count
      @nominees = Nominee.order('nomination_count DESC').page(params[:page])
    end
    
    def show
      @nominee = Nominee.find(params[:id])
    end

  end
end
