class Nominee < ActiveRecord::Base

  INELIGIBLE_NOMINEES = %w(
                            rkh tarcieri yokolet svenfuchs fcheung drbrain
                            sutto jnicklas lsegal mhartl radar steveklabnik
                            josevalim tenderlove sandal qrush wayneeseguin fxn
                            tmm1 dkubb luislavena brynary freelancing-god jnunemaker
                            wycats ryanb rbates igrigorik evan tcopeland jeg2
                            hone skmetz mperham raggi brixen lindaliukas phenriettak ksaa
                            kytrinyx deadprogram rafaelfranca sferik enebo ahoward
                            nobu eileencodes sarahmei zzak jeremyevans samsaffron
                          )

  has_many :nominations
  has_many :recent_nominations, -> {
    merge(Nomination.from_year(Date.today.year)).uniq
  }, class_name: :Nomination

  validates :github_username,
              presence: true,
              length: { maximum: 40 },
              exclusion: {
                in: INELIGIBLE_NOMINEES,
                message: "They're already a Ruby Hero. Please nominate someone else."
              }

  scope :from_year, -> (year) { joins(:nominations).merge(Nomination.from_year(year)).uniq }
  scope :ordered_by_recent_nominations, -> {
    joins(:recent_nominations).
      select("nominees.*, count(nominations.id) AS recent_nominations_count").
      group("nominees.id").
      order("recent_nominations_count DESC")
  }

  def self.begins_with(query)
    where(arel_table[:github_username].matches("#{query}%"))
  end

  def github_username=(username)
    if username.nil?
      super
    else
      self[:github_username] = username.downcase.strip.sub("@", "")
    end
  end

  def merge_into(nominee)
    return false if nominee == self

    # Admins don't care if voting is enabled, we may need to merge duplicate
    # nominees after the public nomination period has ended.
    $voting_enabled = true

    transaction do
      self.nominations.each do |nomination|
        nomination.nominee = nominee
        raise ActiveRecord::Rollback unless nomination.save!
      end
      raise ActiveRecord::Rollback unless destroy
    end

    nominee
  end

  def url
    'http://github.com/%s' % github_username
  end

  def to_param
    github_username
  end

  def to_s
    github_username
  end
end
