class Nomination < ActiveRecord::Base

  # Associations
  belongs_to :nominee
  belongs_to :nominator
  accepts_nested_attributes_for :nominator

  # Validations
  validates :testimonial, :length => { :minimum => 25, :message => "Testimony must be at least 25 characters." }


  def nominee_attributes=(params)
    self.nominee = Nominee.find_or_create_by_github_username(params[:github_username])
  end

  def nominator_attributes=(params)
    self.nominator = Nominator.find_or_create_by_email(params[:email], :name => params[:name] )
  end

end
