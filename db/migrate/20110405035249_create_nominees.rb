class CreateNominees < ActiveRecord::Migration
  def self.up
    create_table :nominees do |t|
      t.string :github_username
      t.string :name
    end
  end

  def self.down
    drop_table :nominees
  end
end
