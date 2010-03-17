class DropMugshotsTableAndReferences < ActiveRecord::Migration
  def self.up
    remove_column :users, :mugshot_id
    drop_table :mugshots
  end

  def self.down
    add_column :users, :mugshot_id
    create_table :mugshots do |t|
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
    end
  end3
end
