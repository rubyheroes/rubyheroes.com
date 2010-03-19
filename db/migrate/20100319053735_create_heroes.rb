class CreateHeroes < ActiveRecord::Migration
  def self.up
    create_table :heroes do |t|
      t.string :name
      t.string :avatar
      t.string :year
      t.timestamps
    end
  end
  
  def self.down
    drop_table :heroes
  end
end
