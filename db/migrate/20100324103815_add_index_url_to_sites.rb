class AddIndexUrlToSites < ActiveRecord::Migration
  def self.up
    add_index :sites, :url
  end

  def self.down
    remove_index :sites, :url
  end
end
