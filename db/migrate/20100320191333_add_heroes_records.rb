class AddHeroesRecords < ActiveRecord::Migration
  class Hero < ActiveRecord::Base
  end
  
  def self.up
    add_column :heroes, :url, :string
    Hero.reset_column_information
    Hero.new({:name=>"Ryan Bates",:year=>"2008",:avatar=>"ryan_bates.jpg",:url=>"http://railscasts.com/"}).save!
    Hero.new({:name=>"Yehuda Katz",:year=>"2008",:avatar=>"yehuda_katz.jpg",:url=>"http://yehudakatz.com/"}).save!
    Hero.new({:name=>"Ilya Grigorik",:year=>"2008",:avatar=>"ilya_grigorik.jpg",:url=>"http://www.igvita.com/"}).save!
    Hero.new({:name=>"Evan Weaver",:year=>"2008",:avatar=>"evan_weaver.jpg",:url=>"http://blog.evanweaver.com/"}).save!
    Hero.new({:name=>"Tom Copeland",:year=>"2008",:avatar=>"tom_copeland.jpg",:url=>"http://tomcopeland.blogs.com/"}).save!
    Hero.new({:name=>"James Edward Gray II",:year=>"2008",:avatar=>"james_gray.jpg",:url=>"http://blog.grayproductions.net/"}).save!
    Hero.new({:name=>"Brian Helmkamp",:year=>"2009",:avatar=>"brian_helmkamp.jpg",:url=>"http://www.brynary.com"}).save!
    Hero.new({:name=>"Aman Gupta",:year=>"2009",:avatar=>"aman_gupta.jpg",:url=>"http://github.com/tmm1"}).save!
    Hero.new({:name=>"Luis Lavena",:year=>"2009",:avatar=>"luis_lavena.jpg",:url=>"http://blog.mmediasys.com"}).save!
    Hero.new({:name=>"Pat Allan",:year=>"2009",:avatar=>"pat_allan.jpg",:url=>"http://freelancing-gods.com"}).save!
    Hero.new({:name=>"Dan Kubb",:year=>"2009",:avatar=>"dan_kubb.jpg",:url=>"http://github.com/dkubb"}).save!
    Hero.new({:name=>"John Nunemaker",:year=>"2009",:avatar=>"john_nunemaker.jpg",:url=>"http://railstips.org"}).save!
  end

  def self.down
    Hero.delete_all
  end
end
