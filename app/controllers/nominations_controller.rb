class NominationsController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :show]

  # GET /nominations
  # GET /nominations.xml
  def index
    redirect_to nomination_sites_path and return unless params[:site_url]

    options = {
      :order_by => "created_at",
      :site_url => params[:site_url],
      :skip_pagination => true }
    @nominations = Nomination.search options

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nominations }
    end
  end

  # GET /nominations/1
  # GET /nominations/1.xml
  def show
    @nomination = Nomination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/new
  # GET /nominations/new.xml
  def new
    redirect_to new_similar_nominations_search_path and return if params[:site_url].blank?
    
    @nomination = Nomination.new
    @nomination.site_url = params[:site_url]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/1/edit
  def edit
    @nomination = Nomination.find(params[:id])
  end

  # POST /nominations
  # POST /nominations.xml
  def create
    @nomination = Nomination.new(params[:nomination])

    respond_to do |format|
      if @nomination.save
        flash[:notice] = 'Thank you for your nomination.'
        format.html { redirect_to(nomination_url(@nomination)) }
        format.xml  { render :xml => @nomination, :status => :created, :location => @nomination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nominations/1
  # PUT /nominations/1.xml
  def update
    @nomination = Nomination.find(params[:id])

    respond_to do |format|
      if @nomination.update_attributes(params[:nomination])
        flash[:notice] = 'Nomination was saved'
        format.html { redirect_to(edit_nomination_url(@nomination)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.xml
  def destroy
    @nomination = Nomination.find(params[:id])
    @nomination.destroy

    respond_to do |format|
      flash[:notice] = 'Nomination was deleted'
      format.html { redirect_to(nominations_url) }
      format.xml  { head :ok }
    end
  end
end
