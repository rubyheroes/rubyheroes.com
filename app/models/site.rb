class Site < ActiveRecord::Base
  has_many :nominations
  attr_accessible :url, :name
  validates_presence_of :url, :name
end
