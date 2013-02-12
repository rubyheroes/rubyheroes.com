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

  desc "Test autocomplete data"
  task :autocomplete => :environment do
    nominees = ["jcasimir", "raggi", "deadprogrammer", "fabianoleite", "danielvlopes", "russ", "ice799", 
      "bcardarella", "rachelmyers", "chapambrose", "nex3", "mergulhao", "sferik", "martinsvalin", "carols10cents", 
      "gregbell", "blowmage", "joeferris", "avdi", "@avdi", "metaskills", "zaiste", "eifion", "joneslee85", "brixen", 
      "fcheung", "robert klemme", "aslakhellesoy", "sarahmei", "jordanbyron", "nbibler", "nicksieger", "jmazzi", 
      "chap", "cavneb", "tarcieri", "charlesmaxwood", "schof", "garybernhart", "sarah mei", "unexist", "wycats2", 
      "ix", "headius", "alloy", "brad edigar", "zdennis", "@svenfuchs", "ambethia", "holman", "damln", "jeff casimir", 
      "bdewitt", "joshk", "drawohara", "matthieusegret", "dchelimsky", "rkh", "mbleigh", "apneadiving", "carlhuda", 
      "floehopper", "ripienaar", "@gregbell", "steveklabnik", "rubiety", "cloudhead", "c7", "jmonteiro", "mhartl", 
      "nusco (paolo perrotta)", "fuzzmonkey", "schneems", "peterc", "brad rushby", "spastorino", "mitchellh", "pilu", 
      "https://github.com/ryanb", "@rafaelfranca", "leongersing", "topfunky", "amatsuda", "sj26", "clnclarinet", 
      "drogus", "evanphx", "eduzera", "michaelklishin", "bascule", "karel minarik", "banister", "solnic", "drbrain", 
      "justinfrench", "woiiiiiii", "davidchelimsky", "xaviershay", "durran", "akitaonrails", "coreyhaines", 
      "progrium", "ernie", "tablatom", "camilleroux", "joshsusser", "netzpirat", "rbates", "hfdsfgsdg", 
      "jeremyevans", "jonleighton", "zenspider", "wycatz", "arsduo", "bbenezech", "reagent", "fnando", 
      "timcharper", "krainboltgreene", "@jruby", "ahoward", "sstephenson", "jugyo", "ko1", "radar", "german", 
      "mxcl", "maxwell", "myronmarston", "asanghi", "citizen428", "jm", "chriseppstein", "rtomayko", "zapnap", 
      "dbrady", "merbist", "vinibaggio", "aaron patterson", "mkelly12", "avdi", "coreyhaynes", "jeremy evans", 
      "sunaku", "patshaughnessy", "cavalle", "ashbb", "bigtiger", "cpytel", "randx", "msgehard", "pengwynn", 
      "rayhightower", "marcinkuzminski", "sinatra", "jgonera", "petro petrovych", "evolve2k", "nigelr", 
      "jeffcohen", "meaganfisher", "ghendry", "elight", "ryan bates", "tpope", "greggpollack", "jmettraux", 
      "josevalim ", "kevinelliott", "tobias", "jtimberman", "krocxkjuqi", "nando vieira", "chris eppstein", 
      "lest", "geemus", "galetahub", "envy labs", "myabc", "noamb", "irz", "seenmyfate", "alindeman", 
      "alex maccaw", "emboss", "chriswailes", "nick sutterer", "will", "derekcollison", "torquebox", "artemk", 
      "daddye", "mokolabs", "h-lame", "ddfreyne", "matz", "pragdave", "jejacks0n", "woilwrzvuf", "dbussink", 
      "headious", "kennethkalmer", "jdodds", "meskyanichi", "jakesgordon", "jonforums", "kk", "michaeldv", 
      "@charlesmaxwood", "benhoskings", "amrnt", "asdfsadf", "funny.falcon", "collectiveidea ", "cesario", 
      "tukan", "argent-smith", "rubiii", "alex-galushka", "fuse", "skaes", "garybernhardt", "defunkt", 
      "indirect", "heel", "apotonick", "geoffrey grosenbach", "cantoniodasilva", "ugisozols", "ohler55", 
      "ultrasaurus", "danielsdeleo", "cmaxw", "ffmike", "kkkkk", " parndt", "spatil", "cstjohn", "dabit", 
      "sarah mei and sarah allen", "stjohncj", "yokolet", "zed-0xff", "dhh", "svenfuchs", "spikex", 
      "remi", "thibaudgg", "frnz", "mattsears", "@wycats", "avdi grimm", "cucumber", "@josevalim", "_why", 
      "jbarnette", "hsbt", "muratguzel", "yehuda katz", "mpapis", "manveru", "xdite", "arunagw", "vatrai", 
      "mohammed", "kotp", "homakov", "zncverbszf", "jashkenas", "svenfuchs", "carlosantoniodasilva", "zsbceqtbgx", 
      "mperham", "parndt", "svczifspft", "russ olsen", "daniel kehoe", "mon-ouie", "qyqnxluquv", "voidlock", 
      "wycat", "josh", "funny-falcon", "ruieglozaf", "vyomglbrsi", "wcovdvmnwj", "nahi", "psousa", "bridgeutopia", 
      "hero", "hone", "qljtzbmh", "begvphnkae", "wzmqmjhurw", "wcwtskkrlj", "priyam", "muhruhjqjc", 
      "gtwbqyffwh", "ryan bates", "valikos", "skmetz", "chneukirchen", "luizvarela", "awards", "ruby", "rodjek", 
      "ixisxum", "sldobri", "rubymaverick", "gio aplon"]

      nominees.each do |nominee|
        Nominee.where(github_username: nominee).first || Nominee.where(github_username: nominee).create
      end
  end
end
