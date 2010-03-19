class NormalizeNominationsTable < ActiveRecord::Migration
  def self.up
    change_table :nominations do |t|
      t.references :nominator
      t.references :site
    end
  end

  def self.down
    change_table :nominations do |t|
      t.remove :nominator, :site
    end
  end
end
