class VotesController < ApplicationController
  before_filter :authenticate

  def index
    @votes = Vote.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end
end
