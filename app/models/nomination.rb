class Nomination < ActiveRecord::Base
  belongs_to :nominator
  belongs_to :site
  validates_length_of :testimonial, :minimum => 25
  validates_presence_of :nominee, :testimonial
  accepts_nested_attributes_for :nominator
  accepts_nested_attributes_for :site
end
