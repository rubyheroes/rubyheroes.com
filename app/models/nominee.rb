class Nominee < ActiveRecord::Base

  INELIGIBLE_NOMINEES = %w( josevalim tenderlove sandal qrush wayneeseguin fxn 
                            tmm1 dkubb luislavena brynary freelancing-god jnunemaker
                            wycats ryanb igrigorik evan tcopeland jeg2
                          )

  # Associations
  has_many :nominations

  # Validations
  validates :github_username,
              :presence => true,
              :length => { :maximum => 40 },
              :exclusion => { :in => INELIGIBLE_NOMINEES, :message => "He's already a Ruby Hero!"}

  #validates :name, :presence => true

  def self.begins_with(query)
    where(arel_table[:github_username].matches("#{query}%"))
  end

  def github_username=(username)
    self[:github_username] = username.try(:downcase)
  end

  def url
    'http://github.com/%s' % github_username
  end

end
