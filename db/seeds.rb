# -*- encoding : utf-8 -*-
past_heroes = [
  # 2008 Heroes
  { name: "Ryan Bates", year: "2008", avatar: "ryan_bates.jpg", url: "http://railscasts.com/" },
  { name: "Yehuda Katz", year: "2008", avatar: "yehuda_katz.jpg", url: "http://yehudakatz.com/" },
  { name: "Ilya Grigorik", year: "2008", avatar: "ilya_grigorik.jpg", url: "http://www.igvita.com/" },
  { name: "Evan Weaver", year: "2008", avatar: "evan_weaver.jpg", url: "http://blog.evanweaver.com/" },
  { name: "Tom Copeland", year: "2008", avatar: "tom_copeland.jpg", url: "http://tomcopeland.blogs.com/" },
  { name: "James Edward Gray II", year: "2008", avatar: "james_gray.jpg", url: "http://blog.grayproductions.net/" },
  # 2009 Heroes
  { name: "Brian Helmkamp", year: "2009", avatar: "brian_helmkamp.jpg", url: "http://www.brynary.com" },
  { name: "Aman Gupta", year: "2009", avatar: "aman_gupta.jpg", url: "https://github.com/tmm1" },
  { name: "Luis Lavena", year: "2009", avatar: "luis_lavena.jpg", url: "http://blog.mmediasys.com" },
  { name: "Pat Allan", year: "2009", avatar: "pat_allan.jpg", url: "http://freelancing-gods.com" },
  { name: "Dan Kubb", year: "2009", avatar: "dan_kubb.jpg", url: "https://github.com/dkubb" },
  { name: "John Nunemaker", year: "2009", avatar: "john_nunemaker.jpg", url: "http://railstips.org" },
  # 2010 Heroes
  { name: "Jose Valim", year: "2010", avatar: "jose_valim.jpg", url: "https://github.com/josevalim" },
  { name: "Aaron Patterson", year: "2010", avatar: "aaron_patterson.jpg", url: "https://github.com/tenderlove" },
  { name: "Gregory Brown", year: "2010", avatar: "gregory_brown.jpg", url: "https://github.com/sandal" },
  { name: "Nick Quaranto", year: "2010", avatar: "nick_quaranto.jpg", url: "https://github.com/qrush" },
  { name: "Wayne Seguin", year: "2010", avatar: "wayne_seguin.jpg", url: "https://github.com/wayneeseguin" },
  { name: "Xavier Noria", year: "2010", avatar: "xavier_noria.jpg", url: "https://github.com/fxn" },
  # 2011 Heroes
  { name: "Darcy Laycock", year: "2011", avatar: "darcy_laycock.jpg", url: "https://github.com/sutto" },
  { name: "Jonas Nicklas", year: "2011", avatar: "jonas_nicklas.jpg", url: "https://github.com/jnicklas" },
  { name: "Loren Segal", year: "2011", avatar: "loren_segal.jpg", url: "https://github.com/lsegal" },
  { name: "Michael Hartl", year: "2011", avatar: "michael_hartl.jpg", url: "https://github.com/mhartl" },
  { name: "Ryan Bigg", year: "2011", avatar: "ryan_bigg.jpg", url: "https://github.com/radar" },
  { name: "Steve Klabnik", year: "2011", avatar: "steve_klabnik.jpg", url: "https://github.com/steveklabnik" },
  # 2012 Heroes
  { name: "Konstantin Haase", year: "2012", avatar: "konstantin_haase.jpg", url: "https://github.com/rkh" },
  { name: "Tony Arcieri", year: "2012", avatar: "tony_arcieri.jpg", url: "https://github.com/tarcieri" },
  { name: "Yoko Harada", year: "2012", avatar: "yoko_harada.jpg", url: "https://github.com/yokolet" },
  { name: "Sven Fuchs", year: "2012", avatar: "sven_fuchs.jpg", url: "https://github.com/svenfuchs" },
  { name: "Frederick Cheung", year: "2012", avatar: "frederick_cheung.jpg", url: "https://github.com/fcheung" },
  { name: "Eric Hodel", year: "2012", avatar: "eric_hodel.jpg", url: "https://github.com/drbrain" },
  # 2013 Heroes
  { name: "Terence Lee", year: "2013", avatar: "terence_lee.jpg", url: "https://github.com/hone" },
  { name: "Sandi Metz", year: "2013", avatar: "sandi_metz.jpg", url: "https://github.com/skmetz" },
  { name: "Mike Perham", year: "2013", avatar: "mike_perham.jpg", url: "https://github.com/mperham" },
  { name: "James Tucker", year: "2013", avatar: "james_tucker.jpg", url: "https://github.com/raggi" },
  { name: "Brian Shirai", year: "2013", avatar: "brian_shirai.jpg", url: "https://github.com/brixen" },
  { name: "Linda Liukas", year: "2013", avatar: "linda_liukas.jpg", url: "https://github.com/lindaliukas" },
  { name: "Pia Henrietta Kekäläinen", year: "2013", avatar: "pia_henrietta_kekalainen.jpg", url: "https://github.com/phenriettak" },
  { name: "Karri Saarinen", year: "2013", avatar: "karri_saarinen.jpg", url: "https://github.com/ksaa" },
  # 2014 Heroes
  { name: "Katrina Owen", year: "2014", avatar: "katrina_owen.jpg", url: "https://github.com/kytrinyx" },
  { name: "Ron Evans", year: "2014", avatar: "ron_evans.jpg", url: "https://github.com/deadprogram" },
  { name: "Rafael Mendonça França", year: "2014", avatar: "rafael_mendonca_franca.jpg", url: "https://github.com/rafaelfranca" },
  { name: "Erik Michaels-Ober", year: "2014", avatar: "erik_michaels-ober.jpg", url: "https://github.com/sferik" },
  { name: "Thomas Enebo", year: "2014", avatar: "thomas_enebo.jpg", url: "https://github.com/enebo" },
  { name: "Ara T. Howard", year: "2014", avatar: "ara_t_howard.jpg", url: "https://github.com/ahoward" },
]

past_heroes.each do |hero|
  Hero.where(hero).first || Hero.where(hero).create
end
