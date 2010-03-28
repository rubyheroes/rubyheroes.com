class AddNominationsCountToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :nominations_count, :integer
    
    Site.reset_column_information
    Site.find(:all).each do |s|
      Site.update_counters s.id, :nominations_count => s.nominations.length
    end
  end

  def self.down
    remove_column :sites, :nominations_count
  end
end
