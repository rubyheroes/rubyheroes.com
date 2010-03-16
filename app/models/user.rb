class User < ActiveRecord::Base
  has_many    :votes
  
  validates_presence_of   :email, :name, :openid_url
  validates_uniqueness_of :email, :openid_url, :case_sensitive => false
  
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :email, :name, :openid_url, :uploaded_data
  
  def self.search(options = {})
    options[:order]     ||= "name"
    options[:per_page]  ||= 15
    User.find(:all, :order => options[:order]) do
      paginate :page => options[:page], :per_page => options[:per_page] unless options[:skip_pagination]
    end
  end

  def uploaded_data=(value)
    @uploaded_data = value
  end

  private
  
  
  def validate
    begin
      self.openid_url = URI::GenericHacks.normalize_url(openid_url)
    rescue URI::InvalidURIError
      errors.add("openid_url", "is invalid")
    end
  end

end