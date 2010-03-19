class CreateNominators < ActiveRecord::Migration
  def self.up
    create_table :nominators do |t|
      t.string :email
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :nominators
  end
end
