class RemoveDenormalizedColumnsFromNominations < ActiveRecord::Migration
  def self.up
    change_table :nominations do |t|
      t.remove "nominator_email", "nominator_name", "site_name", "site_url", "site_subdomain"
    end
  end

  def self.down
    change_table :nominations do |t|
      t.string "nominator_email"
      t.string "nominator_name"
      t.string "site_name"
      t.string "site_name"
      t.string "site_subdomain"
    end
  end
end