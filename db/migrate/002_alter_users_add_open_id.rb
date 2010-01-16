class AlterUsersAddOpenId < ActiveRecord::Migration
  def self.up
    add_column :users, :openid_url, :string
    remove_column :users, :login
    remove_column :users, :crypted_password
    remove_column :users, :salt
    remove_column :users, :remember_token
    remove_column :users, :remember_token_expires_at
  end

  def self.down
    remove_column :users, :openid_url
    add_column :users, :login, :string
    add_column :users, :crypted_password, :string, :limit => 40
    add_column :users, :salt, :string, :limit => 40
    add_column :users, :remember_token, :string
    add_column :users, :remember_token_expires_at, :datetime
  end
end