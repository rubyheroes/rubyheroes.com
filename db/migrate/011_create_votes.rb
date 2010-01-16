class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.column :category_id,      :integer, :null => false
      t.column :nomination_id,    :integer, :null => false
      t.column :user_id,          :integer, :null => false
    end
  end

  def self.down
    drop_table :votes
  end
end
