class AlterHeroesAddUrl < ActiveRecord::Migration
  def self.up
    add_column :heroes, :url, :string
  end

  def self.down
    remove_column :heroes, :url, :string
  end
end
