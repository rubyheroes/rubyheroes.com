class Nominator < ActiveRecord::Base
  has_many :nominations, :dependent => :destroy
  
  attr_accessible :email, :name

  validates_format_of :email,
    :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
    :message => "A valid email address is required."
  validates_presence_of :name,
    :message => "This field is required."

  def to_s
    self.name || self.email
  end
end
