class Nominee < ActiveRecord::Base

  # Associations
  has_many :nominations

  # Validations
  validates :github_username,
              :presence => true,
              :length => { :maximum => 40 }

  #validates :name, :presence => true

  def self.begins_with(query)
    where(arel_table[:github_username].matches("#{query}%"))
  end
end
