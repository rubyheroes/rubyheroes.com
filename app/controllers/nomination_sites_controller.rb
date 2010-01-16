class NominationSitesController < ApplicationController
  before_filter :authenticate
  def index
    @nomination_sites = Nomination.count(:all, :group => "site_subdomain, site_url", :order => "count_all desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nomination_sites }
    end
  end
end
