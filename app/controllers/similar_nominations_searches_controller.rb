class SimilarNominationsSearchesController < ApplicationController
  before_filter :authenticate, :except => [:new, :create]

  def new
    @similar_nominations = []
  end

  def create
    begin
      url = URI::GenericHacks.normalize_url params[:url]
      host = URI.parse(url).host
      parts = host.split(".")
      parts.delete_if { |part| part.length < 3 || part == "www" || TLD::valid?(part) }
    rescue URI::InvalidURIError
      parts = []
    end
    
    @similar_nominations = parts.empty? ? [] : Nomination.search(:site_urls_like => parts)
    
    respond_to do |format|
      format.js
    end
  end
  
end