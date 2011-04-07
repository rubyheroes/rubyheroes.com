module Admin
  class NomineesController < AdminController

    def index
      @nominees = Nominee.order('nomination_count DESC').page(params[:page])
    end
    
    def show
      @nominee = Nominee.find(params[:id])
    end

  end
end
