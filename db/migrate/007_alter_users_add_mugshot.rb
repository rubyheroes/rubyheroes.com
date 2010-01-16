class AlterUsersAddMugshot < ActiveRecord::Migration
  def self.up
    add_column :users, :mugshot_id, :integer, :null => false
  end

  def self.down
    remove_column :users, :mugshot_id
  end
end
