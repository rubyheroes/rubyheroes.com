# credit Josh Knowles and Luke Francl http://railspikes.com/2008/2/1/loading-seed-data
namespace :db do
  desc "Loads initial database models for the current environment."
  task :populate => :environment do
    Dir[File.join(RAILS_ROOT, 'db', 'fixtures', '*.rb')].sort.each { |fixture| load fixture }
    Dir[File.join(RAILS_ROOT, 'db', 'fixtures', RAILS_ENV, '*.rb')].sort.each { |fixture| load fixture }
  end
  
  desc "Sends out the email"
  task :email => :environment do
    sites = [
    ["http://techno-weenie.net/", "Rick", "rick@techno-weenie.net"],
    ["http://hackety.org/", "Why", "why@whytheluckystiff.com"],
    ["http://ryandaigle.com/", "Ryan Daigle", "ryan@ryandaigle.com"],
    ["http://whytheluckystiff.net/","Why", "why@whytheluckystiff.com"],
    ["http://code.whytheluckystiff.net/", "Why", "why@whytheluckystiff.com"]]    
    sites.each do |site|
      nominations = Nomination.find_all_by_site_url(site[0]).collect(&:testimonial)
      MyMailer.deliver_hero_notice(site[2], site[1], nominations)
    end
  end
end
