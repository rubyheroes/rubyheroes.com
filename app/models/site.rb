class Site < ActiveRecord::Base
  has_many :nominations
  attr_accessible :url, :name
  validates_presence_of :url, :name
  
  def url=(value)
    value.strip
    begin
      uri= URI.parse(value)
      write_attribute(:url, uri.host+uri.path)
    rescue URI::InvalidURIError
      errors.add(:url, "is an invalid url")
    end
  end
  
end
