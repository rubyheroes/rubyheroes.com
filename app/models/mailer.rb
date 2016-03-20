class Mailer < ActionMailer::Base

  def hero_notice(email, name, nominations, sent_at = Time.now)
    @subject    = 'Your Ruby Hero Nominations'
    @body       = {:nominations => nominations, :name => name}
    @recipients = email
    @from       = 'gregg@envylabs.com'
    @sent_on    = sent_at
    @headers    = {}
  end
end
