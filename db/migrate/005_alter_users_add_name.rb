class AlterUsersAddName < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string, :null => false
  end

  def self.down
    remove_column :users, :name
  end
end
