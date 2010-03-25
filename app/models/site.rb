class Site < ActiveRecord::Base
  has_many :nominations
  attr_accessible :url, :name
  validates_presence_of :url, :name
  
  def url=(value)
    return if value.nil?
    value.strip!
    value.gsub! /(https?:\/\/)/, ""
    self[:url] = value
  end
  
end
