class Nominator < ActiveRecord::Base
  has_many :nominations, :dependent => :destroy

  validates_presence_of :name,
    message: "This field is required."
  validates_presence_of :email,
    message: "This field is required."

  def to_s
    self.name || self.email
  end
end
