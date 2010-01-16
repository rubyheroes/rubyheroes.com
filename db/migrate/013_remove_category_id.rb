class RemoveCategoryId < ActiveRecord::Migration
  def self.up
    remove_column :nominations, :category_id
  end

  def self.down
    add_column :nominations, :category_id, :integer
  end
end
