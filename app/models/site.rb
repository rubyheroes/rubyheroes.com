class Site < ActiveRecord::Base
  has_many :nominations

  validates_presence_of :url, :name, :message => "This field is required."

  cattr_reader :per_page

  @@per_page = 15

  def url=(value)
    return if value.nil?
    value.strip!
    value.gsub! /(https?:\/\/)/, ""
    self[:url] = value
  end
end
