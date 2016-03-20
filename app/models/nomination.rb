class Nomination < ActiveRecord::Base

  # Associations
  belongs_to :nominee, counter_cache: :nomination_count
  belongs_to :nominator

  accepts_nested_attributes_for :nominator, :nominee

  # Validations
  validates :testimonial,
    presence: true,
    length: {
      minimum: 25, message: "Please try to write a meaningful testimony to explain
      why this person is a Ruby Hero."
    }

  validates :nominator_id, uniqueness: {
    message: "You can only nominate someone once."
  }

  scope :from_year, -> (year) { where("EXTRACT(year FROM created_at) = ?", year)}

  def nominee_attributes=(params)
    self.nominee = Nominee.find_or_create_by(github_username: params[:github_username])
  end

  def nominator_attributes=(params)
    self.nominator = Nominator.find_or_create_by(email: params[:email], name: params[:name])
  end

end
