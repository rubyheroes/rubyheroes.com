class Nomination < ActiveRecord::Base
  belongs_to :nominator
  belongs_to :site
  validates_length_of :testimonial, :minimum => 25, :message => "must be at least 25 charaters"
  validates_presence_of :nominee,
  accepts_nested_attributes_for :nominator
  accepts_nested_attributes_for :site
end
