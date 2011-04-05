class AddNomineeIdToNominations < ActiveRecord::Migration
  def self.up
    rename_column :nominations, :nominee, :nominee_id
    remove_column :nominations, :site_id
  end

  def self.down
    rename_column :nominations, :nominee_id, :nominee
    add_column    :nominations, :site_id, :integer
  end
end
