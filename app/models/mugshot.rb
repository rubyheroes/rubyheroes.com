class Mugshot < ActiveRecord::Base
  has_one :user
  
  has_attachment :content_type => :image, :storage => :s3, :resize_to => [48, 48]
  validates_as_attachment
end
