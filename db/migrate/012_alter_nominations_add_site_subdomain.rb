class AlterNominationsAddSiteSubdomain < ActiveRecord::Migration
  def self.up
    add_column :nominations, :site_subdomain, :string
  end

  def self.down
    remove_column :nominations, :site_subdomain
  end
end
