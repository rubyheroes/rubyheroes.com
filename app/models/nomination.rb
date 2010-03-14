class Nomination < ActiveRecord::Base
  before_save :save_site_subdomain

  belongs_to :category
  
  validates_length_of :testimonial, :minimum => 25
  validates_presence_of :nominee, :nominator_email, :nominator_name, :site_name, :site_url, :testimonial

  attr_accessible :category_id, :nominee, :nominator_email, :nominator_name, :site_name, :site_url, :testimonial
  
  def self.search(options = {})
    options[:order]     ||= "site_subdomain, site_url"
    options[:per_page]  ||= 15
    Nomination.find(:all, :order => options[:order]) do
      site_url == options[:site_url] unless options[:site_url].nil?
      any do
        options[:site_urls_like].each do |site_url_like|
          site_url =~ "%#{site_url_like}%"
        end
      end unless options[:site_urls_like].nil?
      paginate :page => options[:page], :per_page => options[:per_page] unless options[:skip_pagination]
    end
  end
  
  def validate
    begin
      self.site_url = URI::GenericHacks.normalize_url(self.site_url)
      self.site_url = site_url_without_www
    rescue URI::InvalidURIError
      errors.add("site_url", "appears to be invalid. It should be a url like http://www.google.com")
    end
  end
  
  private
  
  def save_site_subdomain
    self.site_subdomain = URI.parse(site_url).subdomain
  end
  
  def site_url_without_www
    uri = URI.parse site_url
    parts = uri.host.split "."
    parts.shift if parts[0] == "www"
    uri.host = parts.join "."
    uri.to_s
  end
  
end
