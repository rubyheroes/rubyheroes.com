class Vote < ActiveRecord::Base
  belongs_to :category
  belongs_to :nomination
  belongs_to :user

  validates_presence_of :category, :nomination, :user
  validates_uniqueness_of :category_id, :scope => :user_id

  attr_accessible :category_id, :nomination_id, :user_id
end
