class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :site_url
      t.string :name
      t.string :email

      t.timestamps
    end
    sites = [["http://jamesgolick.com/", "James", "james@giraffesoft.ca"], 
    ["http://techno-weenie.net/", "Rick", "rick@techno-weenie.net"],
    ["http://hackety.org/", "Why", "why@whytheluckystiff.com"],
    ["http://ryandaigle.com/", "Ryan Daigle", "ryan@ryandaigle.com"],
    ["http://luckysneaks.com/blog", "rsl", "rsl@luckysneaks.com"],
    ["http://dcmanges.com/", "Dan", "daniel.manges@gmail.com"],
    ["http://railscasts.com/", "Ryan", "ryan@railscasts.com"],
    ["http://aaronbedra.com/", "Aaron", "aaron@aaronbedra.com"],
    ["http://railsforum.com/", "Dinooz", "bernardino.lopez@gmail.com"],
    ["http://people.planetpostgresql.org/jdavis", "Jeff", "jeff@j-davis.com"],
    ["http://macournoyer.com/", "Marc", "macournoyer@gmail.com"],
    ["http://rubyplus.org/", "Bala", "bcparanj@gmail.com"],
    ["http://rubyinside.com/", "Peter", "peter@petercooper.co.uk"],
    ["http://nubyonrails.com/", "Geoffrey", "boss@topfunky.com"],
    ["http://peepcode.com/", "Geoffrey", "boss@topfunky.com"],
    ["http://rubylearning.org/", "Satish", "mail@satishtalim.com"],
    ["http://rubylearning.com/", "Satish", "mail@satishtalim.com"],
    ["http://satishtalim.com/", "Satish", "mail@satishtalim.com"],]
    ["http://akitaonrails.com/", "Fábio", "fabioakita@gmail.com"],
    ["http://railsspace.com/", "Michael Hartl and Aurelius Prochazka", "michael@michaelhartl.com"],
    ["http://danielfischer.com/", "Daniel", "me@danielfischer.com"],
    ["http://brainspl.at/", "Ezra", "ezra@engineyard.com"],
    ["http://blog.evanweaver.com/", "Evan", "evan@cloudbur.st"], 
    ["http://onestepback.org/", "Jim", "jim.weirich@gmail.com"],
    ["http://whytheluckystiff.net/","Why", "why@whytheluckystiff.com"],
    ["http://blog.grayproductions.net/", "James", "james@grayproductions.net"],
    ["http://railswithraghu.blogspot.com/", "Raghvendra", "raghubetter@gmail.com"],
    ["http://yehudakatz.com/", "Yehuda", "wycats@gmail.com"],
    ["http://podcast.rubyonrails.org/", "Geoffrey", "boss@topfunky.com"],
    ["http://rails-ssl.blogspot.com/", "Raghavendra", "raghubetter@gmail.com"],
    ["http://code.whytheluckystiff.net/", "Why", "why@whytheluckystiff.com"],
    ["http://errtheblog.com/", "Chris & TJ", "chris@ozmm.org"],
    ["http://blog.zenspider.com/", "Ryan", "ryand-rubyforge@zenspider.com"]
    ["http://drnicwilliams.com/", "Dr. Nic", "drnicwilliams.gmail.com"]
    # Email.create
  end

  def self.down
    drop_table :emails
  end
end
