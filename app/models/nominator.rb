class Nominator < ActiveRecord::Base
  has_many :nominations
  attr_accessible :email, :name
  validates_format_of :email,
  :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  validates_presence_of :email, :name
end
