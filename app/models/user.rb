class User < ActiveRecord::Base
  belongs_to  :mugshot
  has_many    :votes
  
  validates_associated    :mugshot
  validates_presence_of   :email, :mugshot, :name, :openid_url
  validates_uniqueness_of :email, :openid_url, :case_sensitive => false
  
  after_destroy               :destroy_mugshot
  before_validation_on_create :create_mugshot
  before_validation_on_update :update_mugshot
  
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
  
  def create_mugshot
    build_mugshot(:uploaded_data => @uploaded_data)
  end
  
  def destroy_mugshot
    mugshot.destroy
  end
  
  def update_mugshot
    mugshot.uploaded_data = @uploaded_data
    mugshot.save
  end
  
  def validate
    begin
      self.openid_url = OpenIdAuthentication.normalize_url(openid_url)
    rescue OpenIdAuthentication::InvalidOpenId
      errors.add("openid_url", "is invalid")
    end
  end

end